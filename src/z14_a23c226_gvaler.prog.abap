*&---------------------------------------------------------------------*
*& Report z14_a23c226_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z14_a23c226_gvaler.

data(gv_char) = 'LOGALI'.

delete from demo_expressions.

insert demo_expressions from @( value #( id = 1 char1 = 'AABbCDDe' char2 = '123456' ) ).

select single from demo_expressions
       fields id,
              char1,
              char2,
              concat( char1, char2 ) as concat,
              concat_with_space( char1, @gv_char, 2 ) as concat2,
              char1 && char2 && 'HANA-' && @gv_char as ampresand,
              left( char1, 2 ) as left,
              right( char1, 3 ) as right,
              lpad( char2, 18, '0' ) as lpad,
              rpad( char2, 18, '0' ) as rpad,
              ltrim( char1, 'A' ) as ltrim,
              rtrim( char1, 'e' ) as rtrim,
              instr( char1, 'bC' ) as instr,
              replace( char1, 'DD', '__' ) as replace,
              substring( char1, 3, 2 ) as substring,
              lower( char1 ) as lower,
              upper( char1 ) as upper
       where id eq '1'
       into @data(gs_result).

cl_demo_output=>display( gs_result ).
