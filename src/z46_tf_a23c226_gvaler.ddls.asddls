@EndUserText.label: 'Table Function with SO'
define table function z46_tf_a23c226_gvaler
  with parameters
    sel_opt : abap.char( 1333 )
returns
{
  mandt  : abap.clnt;
  carrid : s_carr_id;
  connid : s_conn_id;
  fldate : s_date;
  price  : s_price;
}
implemented by method
  zcl_amdp_gvaler_c226=>get_range_flights;
