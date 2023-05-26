@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BOPF - Transactional'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S
}
@ObjectModel: {
      transactionalProcessingEnabled: true,
      usageType.dataClass: #TRANSACTIONAL,
      modelCategory: #BUSINESS_OBJECT,
      compositionRoot: true,
      createEnabled: true,
      updateEnabled: true,
      deleteEnabled: true,
      writeActivePersistence: 'zscarr_log',
      semanticKey: ['Carrid']
}
define view entity z40_cds_a23c226_gvaler
  as select from zscarr_log
{
      @ObjectModel.readOnly: true
  key bopfkey  as Bopfkey,
      carrid   as Carrid,
      carrname as Carrname,
      currcode as Currcode,
      url      as Url
}
