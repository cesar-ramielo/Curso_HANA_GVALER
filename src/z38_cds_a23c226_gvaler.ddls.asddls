@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumtption - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity z38_cds_a23c226_gvaler
  as select from zsalesorders
  association [0..1] to z37_cds_a23c226_gvaler as _Products on $projection.ProductA = _Products.ProductId
{

  key vbeln   as Vbeln,
  key posnr   as Posnr,
      @ObjectModel.foreignKey.association: '_Products'
      product as ProductA,
      @Consumption.valueHelpDefinition: [{ association: '_Products' }]
      product as ProductB,
      @Consumption.valueHelpDefinition: [{ entity : { name : 'z37_cds_a23c226_gvaler',
                                                      element: 'ProductId'} }]
      product as ProductC,
      @Consumption.valueHelpDefinition: [{ entity : { name : 'z37_cds_a23c226_gvaler',
                                                      element: 'ProductId'},
                                           additionalBinding: [{ localElement: 'Description',
                                                                 element: 'Description' }] }]
      product as ProductD,
      ''      as Description,
      _Products
}
