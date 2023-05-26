*&---------------------------------------------------------------------*
*& Report z20_a23c226_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z20_a23c226_gvaler.

data gs_flights type sflight.

select-options: so_airl for gs_flights-carrid,
                so_fld  for gs_flights-fldate.

data gv_filter type string.

start-of-selection.

try.
  gv_filter =  cl_shdb_seltab=>combine_seltabs(
        exporting
          it_named_seltabs = value #( ( name = 'CARRID' dref = ref #( so_airl[] ) )
                                      ( name = 'FLDATE' dref = ref #( so_fld[] ) ) )
          iv_client_field  = 'MANDT'
      ).
     catch cx_shdb_exception.

endtry.

* write gv_filter.

select from z46_tf_a23c226_gvaler( sel_opt = @gv_filter )
       fields *
       into table @data(gt_flights).

cl_demo_output=>display( gt_flights ).
