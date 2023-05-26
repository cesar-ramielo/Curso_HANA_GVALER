class zcl_amdp_gvaler_c226 definition
  public
  final
  create public .

  public section.

     interfaces if_amdp_marker_hdb.
     interfaces if_oo_adt_classrun.

     types: begin of ty_flight,
              carrid type s_carr_id,
              connid type s_conn_id,
              cityfrom type s_from_cit,
              cityto type s_to_city,
            end of ty_flight,
            ty_flights type standard table of ty_flight.

     class-methods get_flights importing value(iv_mandt)   type mandt
                                         value(iv_carrid)  type s_carr_id
                               exporting value(et_flights) type ty_flights.

     class-methods get_flights2 importing value(iv_mandt2)   type mandt
                                          value(iv_carrid2)  type s_carr_id
                                exporting value(et_flights2) type ty_flights.

     class-methods get_flights_tf for table function z45_tf_a23c226_gvaler.

     class-methods get_range_flights for table function z46_tf_a23c226_gvaler.

  protected section.
  private section.
endclass.



class zcl_amdp_gvaler_c226 implementation.

  method get_flights by database procedure for
                     hdb language sqlscript
                     options read-only
                     using spfli.

       et_flights =  select carrid,
                            connid,
                            cityfrom,
                            cityto
                          from spfli
                          where mandt  = :iv_mandt
                            and carrid = :iv_carrid;

*    et_flights = select * from :table_flights;

endmethod.

  method if_oo_adt_classrun~main.

     zcl_amdp_gvaler_c226=>get_flights2(
       exporting
         iv_mandt2   = sy-mandt
         iv_carrid2  = 'LH'
       importing
         et_flights2 = data(lt_flights) ).

     out->write( lt_flights ).

  endmethod.

  method get_flights2 by database procedure for hdb
                      language sqlscript
                      options read-only
                      using zcl_amdp_gvaler_c226=>get_flights.

    call "ZCL_AMDP_GVALER_C226=>GET_FLIGHTS" ( iv_mandt => :iv_mandt2,
                                               iv_carrid => :iv_carrid2,
                                               et_flights => :et_flights2 );

  endmethod.

  method get_flights_tf by database function for hdb
                        language sqlscript
                        options read-only
                        using scarr spfli.

   return  select sc.mandt as client,
                  sc.carrname,
                  sp.connid,
                  sp.cityfrom,
                  sp.cityto
               from scarr as sc
               inner join spfli sp
                       on sc.mandt = sp.mandt
                      and sc.carrid = sp.carrid
               where sp.mandt = :p_clnt
                 and sp.carrid = :p_carrid
               order by sp.connid;

  endmethod.

  method get_range_flights by database function for hdb
                           language sqlscript
                           options read-only
                           using sflight.

     table_filter = apply_filter( sflight, :sel_opt );

     return select so.mandt,
                   so.carrid,
                   so.connid,
                   so.fldate,
                   so.price
                from :table_filter as so;

  endmethod.

endclass.







