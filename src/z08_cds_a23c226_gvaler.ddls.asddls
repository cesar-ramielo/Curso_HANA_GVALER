@AbapCatalog.sqlViewName: 'Z08VA23GV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Association'
define view z08_cds_a23c226_gvaler
  as select from spfli as FlightsSchedule
  association [0..*] to z07_cds_a23c226_gvaler as _Flights on  _Flights.Carrid = FlightsSchedule.carrid
                                                           and _Flights.Connid = FlightsSchedule.connid

{

  key FlightsSchedule.carrid as Carrid,
  key FlightsSchedule.connid as Connid,
      _Flights 

}
