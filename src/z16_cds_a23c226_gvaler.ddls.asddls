@AbapCatalog.sqlViewName: 'Z16VA23GV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Case'
define view z16_cds_a23c226_gvaler
  as select from spfli
{
  key carrid,
  key connid,

      case
        when distance >= 2000 then 'Long Flights'
        when distance >= 1000 and distance < 2000 then 'Medium Flight'
        when distance < 1000 then 'Short Flight'
        else 'NULL'
      end as FlightType1,

      case distance
        when 2572 then 'Long Flights 2000'
        when 1500 then 'Medium Flight 1500'
        when 1000 then 'Short Flight 1000'
        else 'NULL'
      end as FlightType2,

      case
        when distance >= 2000 then 'Long Flights'
        when carrid = 'AA' and distance < 2000 then 'Medium Flight'
        when connid = '1000' then 'Short Flight'
        else 'NULL'
      end as FlightType3,

      case
       when distance > 3000 then case distid
                                   when 'KM' then 'Long Flight KM'
                                   when 'MI' then 'Long Flight MI'
                                  else 'NO UNIT'
                                 end
       when distance >= 1000 and distance < 2000 then 'Medium Flight'
        when distance < 1000 then 'Short Flight'
        else 'NULL'
      end as FlightType4

}
