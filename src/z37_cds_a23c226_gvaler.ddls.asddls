@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Searchable'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Search.searchable: true
define view entity z37_cds_a23c226_gvaler
  as select from zint_products
  association [0..*] to zint_products as _Text on $projection.ProductId = _Text.product_id
{
      @ObjectModel.text.association: '_Text'
      @Search.defaultSearchElement: true
  key product_id  as ProductId,
      description as Description,
      _Text
}
