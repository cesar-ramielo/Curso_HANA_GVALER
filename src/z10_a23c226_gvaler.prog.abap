*&---------------------------------------------------------------------*
*& Report z10_a23c226_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z10_a23c226_gvaler.

delete from demo_simple_tree.

insert demo_simple_tree from table @( value #(
         ( id = 1 parent_id = 0 name = 'AA' )
         ( id = 2 parent_id = 1 name = 'AA-AA' )
         ( id = 3 parent_id = 2 name = 'AA-AA-AA' )
         ( id = 4 parent_id = 2 name = 'AA-AA-BB' )
         ( id = 5 parent_id = 1 name = 'AA-BB' )
         ( id = 6 parent_id = 5 name = 'AA-BB-AA' )
         ( id = 7 parent_id = 5 name = 'AA-BB-BB' )
         ( id = 8 parent_id = 1 name = 'AA-CC' )
         ( id = 9 parent_id = 0 name = 'BB' )
         ( id = 10 parent_id = 0 name = 'CC' ) ) ).

select from hierarchy( source demo_cds_simple_tree_source
                       child to parent association _tree
                       start where id = 1
                       depth 1 )
       fields id,
              parent,
              name,
              hierarchy_is_cycle,
              hierarchy_is_orphan,
              hierarchy_level,
              hierarchy_parent_rank,
              hierarchy_rank,
              hierarchy_tree_size
        into table @data(lt_results).


select from hierarchy( source demo_cds_parent_child_source
                       child to parent association _relat
                       start where id = 'A'
                       multiple parents allowed
                       orphans root
                       cycles breakup )
       fields id,
              parent,
*              name,
              hierarchy_is_cycle,
              hierarchy_is_orphan,
              hierarchy_level,
              hierarchy_parent_rank,
              hierarchy_rank,
              hierarchy_tree_size
        into table @data(lt_results2).

cl_demo_output=>display( lt_results ).
