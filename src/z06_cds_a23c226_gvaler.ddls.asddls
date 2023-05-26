@AbapCatalog.sqlViewName: 'Z06VA23GV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Text'
@ObjectModel: {
    dataCategory: #TEXT,
    representativeKey: 'Unit'
}
define view z06_cds_a23c226_gvaler
  with parameters
    pLanguage : spras
  as select from t006a
{
     @Semantics.language: true
  key spras as Language,
  key msehi as Unit,
      mseh3 as CommercialFormat,
      mseh6 as TechnicalFormat,
      @Semantics.text: true
      @EndUserText.label: 'Unit of Measure - Text'
      msehl as UnitText
}
where
  spras = $parameters.pLanguage;
