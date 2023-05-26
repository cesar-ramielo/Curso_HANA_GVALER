@AbapCatalog.sqlViewName: 'Z04VA23GV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Union'
define view z04_cds_a23c226_gvaler
  as select from zint_products
{
  key product_id  as ProductId,
      description as Description
}

// union select from zext_products
union all select from zext_products

{
  key id   as ProductId,
      name as Description
}
