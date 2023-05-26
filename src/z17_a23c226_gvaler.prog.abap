*&---------------------------------------------------------------------*
*& Report z17_a23c226_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z17_a23c226_gvaler.

select from z26_cds_a23c226_gvaler
       fields *
       into table @data(gt_results).

if sy-subrc eq 0.
  cl_demo_output=>display( gt_results ).
else.
  write 'No data available'.
endif.
