@AbapCatalog.sqlViewName: 'Z31VA23GV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS - Analytics - DIMENSION'
@Analytics.dataCategory: #DIMENSION
define view z31_cds_a23c226_gvaler
  as select from scarr
{
      @ObjectModel.text.element: ['AirlineName']
  key carrid   as Airline,
      @Semantics.text: true
      carrname as AirlineName,
      @Semantics.currencyCode: true
      currcode as Currency
}
