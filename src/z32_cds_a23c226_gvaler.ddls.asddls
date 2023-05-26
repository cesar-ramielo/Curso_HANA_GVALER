@AbapCatalog.sqlViewName: 'Z32VA23GV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS - Analytics - DIMENSION'
@Analytics.dataCategory: #DIMENSION
@ObjectModel.representativeKey: 'FlightConnection'
define view z32_cds_a23c226_gvaler
  as select from spfli
  association [0..1] to z31_cds_a23c226_gvaler as _Airline on $projection.Airline = _Airline.Airline

{
      @ObjectModel.foreignKey.association: '_Airline'
  key carrid                                  as Airline,
      @ObjectModel.text.element: ['Destination']
  key connid                                  as FlightConnection,
      concat(cityfrom, concat(' - ', cityto)) as Destination,
      _Airline

}
