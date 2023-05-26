*&---------------------------------------------------------------------*
*& Report z09_a23c226_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z09_a23c226_gvaler.

* CTE
with +cte_table as (
    select from scarr
           fields carrname,
           cast( '-' as char( 4 ) ) as connid,
           ' ' as cityfrom,
           '-' as cityto
    where carrid = 'LH'
    union
    select from spfli
          fields '-' as carrname,
                 cast( connid as char( 4 ) ) as connid,
                 cityfrom,
                 cityto
          where carrid = 'LH' )

    select from +cte_table
           fields *
           order by carrname descending,
                    connid,
                    cityfrom,
                    cityto
           into table @data(lt_result)
           up to 5 rows.

cl_demo_output=>display( lt_result ).
