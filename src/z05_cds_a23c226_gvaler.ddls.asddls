@AbapCatalog.sqlViewName: 'Z05VA23GV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Join'
define view z05_cds_a23c226_gvaler
  with parameters
    pCurrency : s_currcode
  as select from spfli   as FlightPlan
    inner join   sflight as Flight on  FlightPlan.carrid = Flight.carrid
                                   and FlightPlan.connid = Flight.connid

{
  key FlightPlan.carrid    as Carrid,
  key Flight.connid        as Connid,
      FlightPlan.countryfr as CountryFrom,
      FlightPlan.countryto as CountryTo,
      Flight.fldate        as FlightDate
}
where
  Flight.currency = $parameters.pCurrency;
