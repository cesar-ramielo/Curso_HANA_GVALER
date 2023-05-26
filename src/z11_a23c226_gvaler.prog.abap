*&---------------------------------------------------------------------*
*& Report z11_a23c226_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z11_a23c226_gvaler.

select from sflights
       fields *
       where carrid eq 'AA'
       %_hints hdb 'INDEX_SEARCH'
       into table @data(gt_results).
