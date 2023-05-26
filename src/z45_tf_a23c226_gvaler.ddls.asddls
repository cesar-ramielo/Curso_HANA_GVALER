@EndUserText.label: 'Table Function'
//@ClientHandling.type: #CLIENT_INDEPENDENT
define table function z45_tf_a23c226_gvaler
  with parameters
    @Environment.systemField: #CLIENT
    p_clnt   : abap.clnt,
    p_carrid : s_carr_id
returns
{
  client   : s_mandt;
  carrname : s_carrname;
  connid   : s_conn_id;
  cityfrom : s_from_cit;
  cityto   : s_to_city;

}
implemented by method
  zcl_amdp_gvaler_c226=>get_flights_tf;
