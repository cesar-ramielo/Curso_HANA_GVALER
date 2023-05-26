@AbapCatalog.sqlViewName: 'Z20VA23GV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Quantity Conversions'
define view z20_cds_a23c226_gvaler
  with parameters
    p_from_unit : abap.unit( 3 ),
    p_to_unit   : abap.unit( 3 )
  as select from spfli
{
  key carrid,
  key connid,
      @Semantics.quantity.unitOfMeasure: 'OriginalUnit'
      distance                                                                         as OriginalQuantity,
      @Semantics.unitOfMeasure: true
      distid                                                                           as OriginalUnit,
      @Semantics.quantity.unitOfMeasure: 'ConvertedUnit'
      cast( unit_conversion( quantity => distance,
                             source_unit => distid,
                             target_unit => $parameters.p_to_unit,
                             error_handling => 'SET_TO_NULL' ) as abap.dec( 10,  3 ) ) as ConvertedQuantity,
      @Semantics.unitOfMeasure: true
      $parameters.p_to_unit                                                            as ConvertedUnit

}
where
  distid = $parameters.p_from_unit;
