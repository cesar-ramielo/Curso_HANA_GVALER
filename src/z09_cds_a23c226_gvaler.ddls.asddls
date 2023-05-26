@AbapCatalog.sqlViewName: 'Z09VA23GV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Base for Association with Parameter'
define view z09_cds_a23c226_gvaler
  with parameters
    pAirlCode : s_carr_id
  as select from scarr
{
  key carrid   as Carrid,
      carrname as Carrname,
      currcode as Currcode,
      url      as Url
}
where
  carrid = $parameters.pAirlCode;
