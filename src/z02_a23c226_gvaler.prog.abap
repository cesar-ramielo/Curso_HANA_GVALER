*&---------------------------------------------------------------------*
*& Report z02_a23c226_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z02_a23c226_gvaler.

select carrid, connid, fldate
     from sflight
     into table @data(gt_new_flights).

data(gv_carrid) = 'AA'.

select carrid, connid, fldate
     from sflight
     into table @gt_new_flights
     where carrid eq @gv_carrid.

read table gt_new_flights into data(gs_new_flights) index 1.

try.

    data(gs_new_flights_2) = gt_new_flights[ 1 ].

    gs_new_flights_2 = gt_new_flights[ carrid = 'AA' connid = '1017' ].

    data(gv_carrid_2) = gt_new_flights[ 3 ]-carrid.


  catch cx_sy_itab_line_not_found into data(gx_expception).
      write gx_expception->get_text(  ).
endtry.

append initial line to gt_new_flights assigning field-symbol(<gs_new_flights>).
<gs_new_flights>-carrid = 'LH'.

data: gv_value_1 type f value '10',
      gv_value_2 type f value '1.9'.

data(gv_final) = gv_value_1 + gv_value_2.

select carrid, connid, fldate
       from sflight
       into table @data(gt_flights).

select carrid, connid, fldate
       from sflight
       into table @data(gt_airline).

data: gt_final type table of sflight,
      gs_final type sflight.

loop at gt_flights assigning field-symbol(<gs_old_flights>)
        where carrid eq 'LH'.

     loop at gt_airline into data(gs_old_airlines)
             where connid = <gs_old_flights>-connid.
        gs_final-carrid = <gs_old_flights>-carrid.
        gs_final-connid = gs_old_airlines-connid.
        append gs_final to gt_final.

     endloop.

endloop.

gt_final = value #( for <gs_new_flights_for> in gt_flights where ( carrid eq 'LH' )
                      for gs_new_airlines in gt_airline where ( connid = <gs_new_flights_for>-connid )
                        ( carrid = <gs_new_flights_for>-carrid
                          connid = gs_new_airlines-connid ) ).
