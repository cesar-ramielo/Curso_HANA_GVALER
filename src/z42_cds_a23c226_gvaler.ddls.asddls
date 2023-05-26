@AbapCatalog.sqlViewName: 'Z42VA23GV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BOPF - View Transactional'
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
define view z42_cds_a23c226_gvaler
  as select from zscarr_log
{
      @ObjectModel.readOnly: true
  key bopfkey  as Bopfkey,
      carrid   as Carrid,
      carrname as Carrname,
      currcode as Currcode,
      url      as Url
}
