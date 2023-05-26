class zcl_a23c226_fuzzy_search definition
  public
  final
  create public .

  public section.
    interfaces if_amdp_marker_hdb.
    interfaces if_oo_adt_classrun.

    types ty_threshold type p length 3 decimals 1.

    class-methods get_customers importing value(iv_name) type s_custname
                                          value(iv_threshold) type ty_threshold
                                exporting value(et_customers) type ty_customers.


  protected section.
  private section.
endclass.



class zcl_a23c226_fuzzy_search implementation.

  method get_customers by database procedure for hdb
                       language sqlscript
                       options read-only
                       using zscustom.

*     et_customers = select * from zscustom
*                           where contains (name, :iv_name );

*     et_customers = select * from zscustom
*                           where contains (name, :iv_name, exact );
      et_customers = select * from zscustom
                           where contains (name, :iv_name, fuzzy( :iv_threshold ) );

  endmethod.

  method if_oo_adt_classrun~main.

     zcl_a23c226_fuzzy_search=>get_customers(
       exporting
         iv_name      = 'Guille'
         iv_threshold = '0.6'
       importing
         et_customers = data(lt_customers)  ).

    out->write( lt_customers ).

  endmethod.

endclass.









