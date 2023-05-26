*&---------------------------------------------------------------------*
*& Report z21_a23c226_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z21_a23c226_gvaler.

data: gv_seg_value type zif_zdp_a23c226=>iv_seg_value,
      gt_work_tab  type table of zif_zdp_a23c226=>it_work_tab,
      gt_out       type table of zif_zdp_a23c226=>et_out.

try.

    call database procedure zdp_a23c226
      exporting
        iv_seg_value = gv_seg_value
        it_work_tab  = gt_work_tab
      importing
        et_out       = gt_out.

  catch cx_sy_db_procedure_sql_error into data(gx_sql_error).
    write gx_sql_error->get_text(  ).
endtry.

cl_demo_output=>display( gt_out ).
