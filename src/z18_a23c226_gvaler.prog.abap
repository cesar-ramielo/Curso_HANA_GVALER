*&---------------------------------------------------------------------*
*& Report z18_a23c226_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z18_a23c226_gvaler.

select from z27_cds_a23c226_gvaler with privileged access
       fields *
       into table @data(gt_flights).

if sy-subrc eq 0.
  cl_demo_output=>display( gt_flights ).
else.
  write 'No Data'.
endif.
