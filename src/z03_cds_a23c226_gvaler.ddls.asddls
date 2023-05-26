@AbapCatalog.sqlViewName: 'Z03VA23GV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption - VDM'
@VDM.viewType: #CONSUMPTION
@Analytics.query: true
define view z03_cds_a23c226_gvaler
  as select from z02_cds_a23c226_gvaler
{
      @AnalyticsDetails.query.axis: #ROWS
  key Carrid,
      @AnalyticsDetails.query.axis: #ROWS
  key Connid,
      @AnalyticsDetails.query.axis: #ROWS
      Countryfr,
      @AnalyticsDetails.query.axis: #ROWS
      Cityfrom,
      @AnalyticsDetails.query.axis: #ROWS
      Airpfrom,
      @AnalyticsDetails.query.axis: #ROWS
      Countryto,
      @AnalyticsDetails.query.axis: #ROWS
      Cityto,
      @AnalyticsDetails.query.axis: #COLUMNS
      Distance,
      @AnalyticsDetails.query.axis: #COLUMNS
      Distid
}
