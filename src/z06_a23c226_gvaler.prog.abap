*&---------------------------------------------------------------------*
*& Report z06_a23c226_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z06_a23c226_gvaler.

select from spfli
       fields carrid, connid
       where fltime between '' and ''
       group by carrid, connid
       order by carrid descending
       into table @data(gt_results)
       up to 10 rows.
