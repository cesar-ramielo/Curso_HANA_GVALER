@AbapCatalog.sqlViewName: 'Z18VA23GV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Session | System variables'
define view z18_cds_a23c226_gvaler
  as select from scarr
{
  key carrid,
      $session.user            as SystemUser,
      $session.client          as ClientElemn,
      $session.system_language as SystemLanguage,
      $session.system_date     as SystemDate,
      $session.user_date       as UserDate,
      $session.user_timezone   as UserTimezone
}
