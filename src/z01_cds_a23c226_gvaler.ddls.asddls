@AbapCatalog.sqlViewName: 'Z01VA23GV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic - VDM'
@VDM.viewType: #BASIC
define view z01_cds_a23c226_gvaler
  as select from spfli
{
  key carrid    as Carrid,
  key connid    as Connid,
      countryfr as Countryfr,
      cityfrom  as Cityfrom,
      airpfrom  as Airpfrom,
      countryto as Countryto,
      cityto    as Cityto,
      airpto    as Airpto,
      fltime    as Fltime,
      deptime   as Deptime,
      arrtime   as Arrtime,
      distance  as Distance,
      distid    as Distid,
      fltype    as Fltype,
      period    as Period
}
