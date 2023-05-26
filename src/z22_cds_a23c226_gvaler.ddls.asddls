@AbapCatalog.sqlViewName: 'Z22VA23GV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Tree Hierachy'
define view z22_cds_a23c226_gvaler
  as select from ztree
  association [0..*] to z22_cds_a23c226_gvaler as _tree on $projection.ParentId = _tree.Id
{
  key id        as Id,
  key parent_id as ParentId,
      name      as Name,
      _tree
}
