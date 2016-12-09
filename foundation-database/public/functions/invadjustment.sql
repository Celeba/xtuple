DROP FUNCTION IF EXISTS invAdjustment(INTEGER, NUMERIC, TEXT, TEXT);

DROP FUNCTION IF EXISTS invAdjustment(INTEGER, NUMERIC, TEXT, TEXT, TIMESTAMP WITH TIME ZONE);

DROP FUNCTION IF EXISTS invAdjustment(INTEGER, NUMERIC, TEXT, TEXT, TIMESTAMP WITH TIME ZONE, NUMERIC);

DROP FUNCTION IF EXISTS invAdjustment(INTEGER, NUMERIC, TEXT, TEXT, TIMESTAMP WITH TIME ZONE, NUMERIC, INTEGER);

CREATE OR REPLACE FUNCTION invAdjustment(pItemsiteid      INTEGER, 
                                         pQty             NUMERIC, 
                                         pDocumentNumber  TEXT, 
                                         pComments        TEXT, 
                                         pGlDistTS        TIMESTAMP WITH TIME ZONE 
                                                          DEFAULT CURRENT_TIMESTAMP, 
                                         pCostValue       NUMERIC DEFAULT NULL, 
                                         pGlAccountid     INTEGER DEFAULT NULL,
                                         pItemlocSeries   INTEGER DEFAULT NULL) 
  RETURNS INTEGER AS $$
-- Copyright (c) 1999-2014 by OpenMFG LLC, d/b/a xTuple. 
-- See www.xtuple.com/CPAL for the full text of the software license.
DECLARE
  _invhistId      INTEGER;
  _itemlocSeries  INTEGER;
  
BEGIN

  IF (pItemlocSeries <= 0) THEN
    RAISE EXCEPTION 'pItemlocSeries % must be null or a valid int [xtuple: invAdjustment]', pItemlocSeries;
  END IF;

  --  Make sure the passed itemsite points to a real item
  IF ( ( SELECT (item_type IN ('R', 'F') OR itemsite_costmethod = 'J')
         FROM itemsite, item
         WHERE ( (itemsite_item_id=item_id)
          AND (itemsite_id=pItemsiteid) ) ) ) THEN
    RAISE EXCEPTION 'Item is not eligible for inventory adjustments based on item_type 
      or itemsite_costmethod [xtuple: invAdjustment, -1]';
  END IF;

  SELECT postinvtrans(itemsite_id, 'AD'::TEXT, pQty, 'I/M'::TEXT, 'AD'::TEXT, pDocumentNumber, ''::TEXT,
                       ('Miscellaneous Adjustment for item ' || item_number || E'\n' ||  pComments),
                       costcat_asset_accnt_id, coalesce(pGlAccountid, costcat_adjustment_accnt_id),
                       COALESCE(pItemlocSeries, NEXTVAL('itemloc_series_seq'))::INTEGER, pGlDistTS, pCostValue,
                       NULL::INTEGER, NULL::NUMERIC, (pItemlocSeries IS NOT NULL)) INTO _invhistId
  FROM itemsite, item, costcat
  WHERE itemsite_item_id=item_id
    AND itemsite_costcat_id=costcat_id
    AND itemsite_id=pItemsiteid;

  RETURN _invhistId;
END;
$$ LANGUAGE 'plpgsql';
