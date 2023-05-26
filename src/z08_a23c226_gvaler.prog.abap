*&---------------------------------------------------------------------*
*& Report z08_a23c226_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z08_a23c226_gvaler.

class lcl_union definition.
  public section.
    class-methods main.
endclass.

class lcl_union implementation.

  method main.

    data(lcl_output) = cl_demo_output=>new(  ).

    select from zint_products
           fields product_id as id,
                  description

    union distinct

    select from zext_products
           fields id,
                  name as description
    into table @data(lt_union_distict).

    lcl_output->begin_section( 'Union Distinct' )->write( lt_union_distict ).

    select from zint_products
           fields product_id as id,
                  description

    union all

    select from zext_products
           fields id,
                  name as description
    into table @lt_union_distict.

    lcl_output->begin_section( 'Union All' )->write( lt_union_distict ).

    select from zint_products
       fields product_id as id,
              description
    union distinct
    select from zext_products
           fields id,
                  name as description
    union distinct

    ( select from zint_products
           fields product_id as id,
                  description

    union all

    select from zext_products
           fields id,
                  name as description )
    into table @lt_union_distict.

    lcl_output->begin_section( 'Union Mixed' )->write( lt_union_distict ).


    lcl_output->display(  ).


  endmethod.

endclass.

start-of-selection.
  lcl_union=>main(  ).
