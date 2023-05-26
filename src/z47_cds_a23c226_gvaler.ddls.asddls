@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ALV IDA'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity z47_cds_a23c226_gvaler
  with parameters
    p_Date : s_date
  as select from spfli   as FlightPlan
    inner join   sflight as Flight on  FlightPlan.carrid = Flight.carrid
                                   and FlightPlan.connid = Flight.connid
{
  key FlightPlan.carrid    as Carrid,
  key Flight.connid        as Connid,
      FlightPlan.countryfr as CountryFrom,
      FlightPlan.countryto as CountryTo,
      Flight.fldate        as FlightDate,
      FlightPlan.period    as Period,
      @Semantics.amount.currencyCode: 'Currency'
      Flight.price         as Price,
      Flight.currency      as Currency
}
where
  Flight.fldate >= $parameters.p_Date;
