*&---------------------------------------------------------------------*
*& Report z19_a23c226_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z19_a23c226_gvaler.

class lcl_cds_me definition.
  public section.
    class-methods main.
endclass.

class lcl_cds_me implementation.

  method main.

    data(lo_out) = cl_demo_output=>new(  )->next_section( 'NO Metadata Extensions' ).

    cl_dd_ddl_annotation_service=>get_annos(
      exporting
        entityname         = 'z28_cds_a23c226_gvaler'
        metadata_extension = abap_false
      importing
        element_annos      = data(lt_elements) ).

    delete lt_elements where elementname <> 'CARRID' and
                             elementname <> 'CONNID'.

    lo_out->write( lt_elements )->next_section( 'WITH Metadata Extension' ).

    cl_dd_ddl_annotation_service=>get_annos(
      exporting
        entityname         = 'z28_cds_a23c226_gvaler'
        metadata_extension = abap_true
      importing
        element_annos      = lt_elements ).

    delete lt_elements where elementname <> 'CARRID' and
                             elementname <> 'CONNID'.

    lo_out->write( lt_elements )->display(  ).

  endmethod.

endclass.

start-of-selection.

  lcl_cds_me=>main(  ).
