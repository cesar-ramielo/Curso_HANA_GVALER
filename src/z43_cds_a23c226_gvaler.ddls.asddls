@AbapCatalog.sqlViewName: 'Z43VA23GV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BOPF - View Consumption'
@ObjectModel: {
    transactionalProcessingDelegated: true,
    compositionRoot: true,
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true,
    semanticKey: ['Carrid']
}
@OData.publish: true
define view z43_cds_a23c226_gvaler
  as select from z42_cds_a23c226_gvaler
{
  key Bopfkey,
      Carrid,
      Carrname,
      Currcode,
      Url
}
