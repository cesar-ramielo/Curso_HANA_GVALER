class zcl_pricedisc_virt definition
  public
  final
  create public .

  public section.
    interfaces if_sadl_exit.
    interfaces if_sadl_exit_calc_element_read.
  protected section.
  private section.
endclass.



class zcl_pricedisc_virt implementation.

  method if_sadl_exit_calc_element_read~get_calculation_info.

    check line_exists( it_requested_calc_elements[ table_line = 'DISCOUNT' ] ).

    data ls_filed_data type sadl_entity_element.

    ls_filed_data = 'TYPECODE'.
    insert ls_filed_data into table et_requested_orig_elements.

    ls_filed_data = 'TAXTARIFCODE'.
    insert ls_filed_data into table et_requested_orig_elements.

    ls_filed_data = 'PRICE'.
    insert ls_filed_data into table et_requested_orig_elements.

  endmethod.

  method if_sadl_exit_calc_element_read~calculate.


    check not it_original_data is initial.

    data lt_calculated type table of  z44_cds_a23c226_gvaler.

    lt_calculated = corresponding #( it_original_data ).

    loop at lt_calculated assigning field-symbol(<ls_calculated>)
          where TypeCode eq 'PR' and TaxTarifCode eq '1'.
      <ls_calculated>-Discount = <ls_calculated>-Price * '0.9'.
    endloop.

    ct_calculated_data = corresponding #( lt_calculated ).

  endmethod.

endclass.
