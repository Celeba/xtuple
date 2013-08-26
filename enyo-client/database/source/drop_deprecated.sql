DROP TABLE IF EXISTS xt.grp CASCADE;
DROP TABLE IF EXISTS xt.grppriv CASCADE;
DROP TABLE IF EXISTS xt.usrgrp CASCADE;
DROP TABLE IF EXISTS xt.usrpref CASCADE;
DROP TABLE IF EXISTS xt.usrpriv CASCADE;
DROP TABLE IF EXISTS xt.priv CASCADE;
DROP TABLE IF EXISTS xt.useracct CASCADE;
DROP TABLE IF EXISTS xt.useracctorg CASCADE;
DROP TABLE IF EXISTS xt.userpriv CASCADE;
DROP TABLE IF EXISTS xt.userrole CASCADE;
DROP TABLE IF EXISTS xt.userrolepriv CASCADE;
DROP TABLE IF EXISTS xt.useruserrole CASCADE;
DROP TABLE IF EXISTS xt.usrorg CASCADE;
DROP TABLE IF EXISTS xt.filter CASCADE;
DROP VIEW IF EXISTS xt.usr CASCADE;
DROP FUNCTION IF EXISTS xt.createuser(text, boolean);
DROP FUNCTION IF EXISTS xt.user_account_sync(text);
DROP TRIGGER IF EXISTS grp_did_change on public.grp;
DROP TRIGGER IF EXISTS grppriv_did_change on public.grppriv;
DROP TRIGGER IF EXISTS usrpref_did_change on usrpref;
--DROP TRIGGER IF EXISTS useracct_did_change on xt.useracct;
--DROP TRIGGER IF EXISTS usrgrp_did_change on xt.usrgrp;
--DROP TRIGGER IF EXISTS usrpref_did_change on xt.usrpref;
--DROP TRIGGER IF EXISTS usrpriv_did_change on xt.usrpriv;

--delete from xt.pkgscript where script_name in ('user', 'users', 'userPreferences');
