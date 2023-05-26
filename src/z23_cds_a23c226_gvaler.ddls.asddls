define hierarchy z23_cds_a23c226_gvaler
  with parameters
    pId : abap.int4
  as parent child hierarchy(
    source z22_cds_a23c226_gvaler
    child to parent association _tree
    start where
      Id = $parameters.pId
    siblings order by
      Id
    multiple parents allowed
    cycles breakup
  )
{
  Id,
  ParentId,
  Name,
  $node.hierarchy_is_cycle    as NodeCycle,
  $node.hierarchy_is_orphan   as NoodOrphan,
  $node.hierarchy_level       as NoodLevel,
  $node.hierarchy_parent_rank as NoodaParentRank,
  $node.hierarchy_rank        as NoodRank,
  $node.hierarchy_tree_size   as NoodTreeSize
}
