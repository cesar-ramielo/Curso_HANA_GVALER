@AbapCatalog.sqlViewName: 'Z14VA23GV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Aggregations'
define view z14_cds_a23c226_gvaler
  as select from spfli
{
  key carrid,
  key connid,
      min(fltime)              as min_fltime,
      max(fltime)              as max_fltime,
      sum(fltime)              as sum_fltime,
      avg(fltime)              as avg_fltime,
      count( distinct fltime ) as count_fltime
}
group by
  carrid,
  connid;
