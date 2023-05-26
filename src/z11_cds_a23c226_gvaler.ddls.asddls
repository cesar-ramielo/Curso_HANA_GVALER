@AbapCatalog.sqlViewName: 'Z11VA23GV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Path Expression I'
define view z11_cds_a23c226_gvaler
  as select from spfli
  association [0..*] to sflight  as _Flight      on  _Flight.carrid = spfli.carrid
                                                 and _Flight.connid = spfli.connid
  association [1..1] to sairport as _AirportFrom on  _AirportFrom.id = spfli.airpfrom
  association [1..1] to sairport as _AirportTo   on  _AirportTo.id = spfli.airpto

{
  key carrid,
  key connid,
      spfli.airpfrom,
      spfli.airpto,
      _Flight,
      _AirportFrom,
      _AirportTo
}
