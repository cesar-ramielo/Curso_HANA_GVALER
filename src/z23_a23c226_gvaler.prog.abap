*&---------------------------------------------------------------------*
*& Report z23_a23c226_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z23_a23c226_gvaler.

*cl_salv_gui_table_ida=>create( 'MARA' )->fullscreen(  )->display(  ).

data gs_flights type spfli.

select-options so_carid for gs_flights-carrid.
parameters p_date type s_date.

try.

* ALV Instance
    data(go_salv) = cl_salv_gui_table_ida=>create_for_cds_view( iv_cds_view_name = 'z47_cds_a23c226_gvaler' ).

* CDS Parameters
    go_salv->set_view_parameters( it_parameters = value #( ( name = 'p_Date' value = p_date ) ) ).

* Filter Select Options
    data(go_collector) = new cl_salv_range_tab_collector(  ).

    go_collector->add_ranges_for_name( iv_name   = 'CARRID'
                                       it_ranges = so_carid[] ).

    go_collector->get_collected_ranges( importing et_named_ranges = data(gt_named_ranges) ).

*    go_salv->set_select_options( it_ranges = gt_named_ranges ).

* Filters with Conditions

    data(go_condition_factory) = go_salv->condition_factory(  ).

    data(go_conditions) = go_condition_factory->equals( name = 'COUNTRYFROM'
                                                        value = 'US' )->or(
                          go_condition_factory->equals( name = 'COUNTRYFROM'
                                                        value = 'IT' ) ).
    try.

        go_salv->set_select_options(
          exporting
            it_ranges    = gt_named_ranges
            io_condition = go_conditions ).

      catch cx_salv_ida_associate_invalid.
      catch cx_salv_db_connection.
      catch cx_salv_ida_condition_invalid.
      catch cx_salv_ida_unknown_name.
    endtry.

* Field Catalog
   go_salv->field_catalog(  )->set_field_header_texts(
      exporting
          iv_field_name = 'CARRID'
          iv_header_text = 'Airline Code'
   ).

* Aggregation
  go_salv->default_layout(  )->set_aggregations(
                         it_aggregations = value #( ( field_name = 'PRICE'
                                                      function = if_salv_service_types=>cs_function_code-sum ) ) ).

   go_salv->default_layout(  )->set_sort_order( it_sort_order = value #( ( field_name = 'CARRID'
                                                                           descending = abap_off
                                                                           is_grouped = abap_on ) ) ).
* Display
    go_salv->fullscreen(  )->display(  ).

  catch cx_salv_db_connection.
  catch cx_salv_db_table_not_supported.
  catch cx_salv_ida_contract_violation.
  catch cx_salv_function_not_supported.

endtry.
