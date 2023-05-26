*&---------------------------------------------------------------------*
*& Report z16_a23c226_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z16_a23c226_gvaler.

try.

    select from hierarchy( source z22_cds_a23c226_gvaler
                           child to parent association _tree
                           start where Id = 1
                           siblings order by id ascending
                           multiple parents allowed
                           orphans root
                           cycles breakup )
                fields id,
                       parentid,
                       name,
                       hierarchy_level,
                       hierarchy_is_cycle,
                       hierarchy_parent_rank
                 into table @data(gt_results).
  catch cx_sy_open_sql_db into data(gx_sql_db).
    write gx_sql_db->get_text(  ).
endtry.

cl_demo_output=>display( gt_results ).
