DROP FUNCTION IF EXISTS asofinvbal(INTEGER, DATE);
DROP FUNCTION IF EXISTS asofinvnn(INTEGER, DATE);
DROP FUNCTION IF EXISTS asofinvqty(INTEGER, DATE);
DROP FUNCTION IF EXISTS forwardUpdateItemsite(INTEGER);
DROP FUNCTION IF EXISTS postValueintoInvBalance(INTEGER, DATE, NUMERIC, NUMERIC, NUMERIC, NUMERIC);
DROP FUNCTION IF EXISTS apCurrGain(INTEGER, INTEGER, NUMERIC, DATE);
DROP FUNCTION IF EXISTS arCurrGain(INTEGER, INTEGER, NUMERIC, DATE);
DROP FUNCTION IF EXISTS createcustomer(INTEGER);
DROP FUNCTION IF EXISTS dropstdopntable();
DROP FUNCTION IF EXISTS _itemaliastrigger();
DROP FUNCTION IF EXISTS updateprice(INTEGER, NUMERIC);
DROP FUNCTION IF EXISTS updateprice(INTEGER, CHAR, NUMERIC);
DROP FUNCTION IF EXISTS updatepricesbypricingschedule(INTEGER, CHAR, NUMERIC, BOOLEAN);
DROP FUNCTION IF EXISTS updatepricesbyproductcategory(INTEGER, TEXT, CHAR, NUMERIC, BOOLEAN);
DROP FUNCTION IF EXISTS calculatepretaxtotal(INTEGER, INTEGER, DATE, INTEGER, NUMERIC);
DROP FUNCTION IF EXISTS calculatesubtax(INTEGER, DATE, INTEGER, NUMERIC, INTEGER);
DROP FUNCTION IF EXISTS calculatetaxdetail(INTEGER, INTEGER, DATE, INTEGER, NUMERIC);
DROP FUNCTION IF EXISTS calculatetaxdetailline(TEXT, INTEGER);
DROP FUNCTION IF EXISTS calculatetaxdetailsummary(TEXT, INTEGER, TEXT);
DROP FUNCTION IF EXISTS calculatetaxdetailsummary(TEXT, INTEGER, TEXT, INTEGER, DATE, INTEGER, NUMERIC, BOOLEAN);
DROP FUNCTION IF EXISTS calculatetax(INTEGER, INTEGER, DATE, INTEGER, NUMERIC);
DROP FUNCTION IF EXISTS calculatetaxhist(TEXT, INTEGER, INTEGER, INTEGER, DATE, INTEGER, NUMERIC);
DROP FUNCTION IF EXISTS calcCobillAmt(INTEGER);
DROP FUNCTION IF EXISTS calcCobillTax(INTEGER);
DROP FUNCTION IF EXISTS calcCobmiscAmt(INTEGER);
DROP FUNCTION IF EXISTS calcCobmiscTax(INTEGER);
DROP FUNCTION IF EXISTS calcVoucherFreight(INTEGER);
DROP FUNCTION IF EXISTS calcVoucherTax(INTEGER);
DROP FUNCTION IF EXISTS calcVoucherAmt(INTEGER);
DROP FUNCTION IF EXISTS _vodistBeforeTrigger() CASCADE;

DELETE FROM pkghead
 WHERE pkghead_name = 'fixcountry';
