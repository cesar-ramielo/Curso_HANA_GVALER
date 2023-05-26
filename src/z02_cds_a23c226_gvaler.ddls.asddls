@AbapCatalog.sqlViewName: 'Z02VA23GV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite - VDM'
@VDM.viewType: #COMPOSITE
@Analytics.dataCategory: #CUBE
define view z02_cds_a23c226_gvaler
  as select from z01_cds_a23c226_gvaler
{
  key Carrid,
  key Connid,
      Countryfr,
      Cityfrom,
      Airpfrom,
      Countryto,
      Cityto,
      Airpto,
      Fltime,
      Deptime,
      Arrtime,
      @DefaultAggregation: #SUM
      @Semantics.quantity.unitOfMeasure: 'Distid'
      Distance,
      @Semantics.unitOfMeasure: true
      Distid,
      Fltype,
      Period
}
