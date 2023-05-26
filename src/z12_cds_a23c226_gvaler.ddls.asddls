@AbapCatalog.sqlViewName: 'Z12VA23GV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Path Expression II'
define view z12_cds_a23c226_gvaler
  as select from scarr
  association [*] to z11_cds_a23c226_gvaler as _Flights on _Flights.carrid = scarr.carrid
{
  key scarr.carrid,
      scarr.carrname,
      _Flights
}
