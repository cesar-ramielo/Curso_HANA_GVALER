@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BOPF - Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@ObjectModel: {
    transactionalProcessingDelegated: true,
    compositionRoot: true,
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true,
    semanticKey: ['Carrid']
}
@OData.publish: true
define view entity z41_cds_a23c226_gvaler
  as select from z40_cds_a23c226_gvaler
{
  key Bopfkey,
      Carrid,
      Carrname,
      Currcode,
      Url
}
