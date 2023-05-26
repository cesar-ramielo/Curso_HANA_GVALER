*&---------------------------------------------------------------------*
*& Report z15_a23c226_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z15_a23c226_gvaler.

data gv_carrid type s_carr_id value 'LH'.

select from z12_cds_a23c226_gvaler as cds
       fields
       cds~carrid as Carrid,
       cds~carrname as CompanyName,
       \_Flights-connid as FlightNumber,
       \_Flights-airpfrom as AirportFrom,
       \_Flights\_AirportFrom-name as AirportFromName,
       \_Flights-airpto as AirportTo,
       \_Flights\_AirportTo-name as AirportToName,
       \_Flights\_Flight-fldate as FlightDate,
       \_Flights\_Flight-price as Price,
       \_Flights\_Flight-currency as Currency
       where cds~carrid eq @gv_carrid
       into table @data(gt_results).

if sy-subrc eq 0.
  cl_demo_output=>display( gt_results ).
endif.
