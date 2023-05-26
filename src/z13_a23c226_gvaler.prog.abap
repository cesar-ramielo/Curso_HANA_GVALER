*&---------------------------------------------------------------------*
*& Report z13_a23c226_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z13_a23c226_gvaler.

data(gv_offset) = 18.

data gv_decimal type p length 15 decimals 4 value '35.0671'.

delete from demo_expressions.

insert demo_expressions from @( value #( id = 1 num1 = 14 num2 = 8 ) ).

select single from demo_expressions
       fields id,
       num1,
       num2,
       cast( num1 as fltp ) / cast( num2 as fltp ) as ratio,
       division( num1, num2, 2 ) as division,
       div( num1, num2 ) as div,
       mod( num1, num2 ) as mod,
       num1 + num2 + @gv_offset as sum,
       abs( num1 - num2 ) as abs,
       @gv_decimal as decimal,
       ceil( @gv_decimal ) as ceil,
       floor( @gv_decimal ) as floor,
       round( @gv_decimal, 2 ) as round
       where id eq '1'
       into @data(gs_result).

cl_demo_output=>display( gs_result ).
