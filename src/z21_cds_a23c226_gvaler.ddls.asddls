@AbapCatalog.sqlViewName: 'Z21VA23GV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Currency Conversions'
define view z21_cds_a23c226_gvaler
  with parameters
    p_Curency : abap.cuky
  as select from sflight
{

  key carrid,
  key connid,
  key fldate,
      @Semantics.amount.currencyCode: 'Currency'
      price                                               as Price,
      @Semantics.currencyCode: true
      currency                                            as Currency,
      @Semantics.amount.currencyCode: 'ConvertedCurrency'
      currency_conversion( amount => price,
                           source_currency => currency,
                           target_currency => $parameters.p_Curency,
                           exchange_rate_date => fldate ) as PriceConverted,
      @Semantics.currencyCode: true
      $parameters.p_Curency                               as ConvertedCurrency
}
