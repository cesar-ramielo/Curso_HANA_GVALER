@AbapCatalog.sqlViewName: 'Z19VA23GV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Time Zone Functions'
define view z19_cds_a23c226_gvaler
  as select from scarr
{
  abap_system_timezone($session.client, 'NULL')              as SystemTz,
  abap_user_timezone($session.user, $session.client, 'NULL') as UserTz
}
where
  carrid = 'LH';
