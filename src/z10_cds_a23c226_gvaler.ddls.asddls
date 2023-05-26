@AbapCatalog.sqlViewName: 'Z10VA23GV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Association with Parameter'
define view z10_cds_a23c226_gvaler
  with parameters
    pAirlCode : s_carr_id
  as select from sflight as Flight
  association [1] to z09_cds_a23c226_gvaler as _Airline on _Airline.Carrid = Flight.carrid

{
  key Flight.carrid,
  key Flight.connid,
  key fldate,
      @Semantics.amount.currencyCode: 'Currcode'
      price,
      planetype,
      @Semantics.currencyCode: true
      _Airline(pAirlCode: $parameters.pAirlCode).Currcode,
      _Airline(pAirlCode: $parameters.pAirlCode).Carrname,
      _Airline(pAirlCode: $parameters.pAirlCode).Url
}
where
  Flight.carrid = $parameters.pAirlCode;
