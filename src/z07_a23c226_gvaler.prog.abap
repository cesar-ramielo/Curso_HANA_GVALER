*&---------------------------------------------------------------------*
*& Report z07_a23c226_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z07_a23c226_gvaler.

class lcl_case definition.
  public section.
    class-methods main.
endclass.

class lcl_case implementation.

  method main.

    delete from demo_expressions.

    data(lcl_random) = cl_abap_random_int=>create( seed = conv i( sy-uzeit )
                                                   min  = 1
                                                   max  = 100 ).

    insert demo_expressions from table @( value #(
                                 for i = 0 until i > 9 ( id = i
                                                         num1 = lcl_random->get_next(  )
                                                         num2 = lcl_random->get_next(  ) ) ) ).

    select from demo_expressions
           fields id, num1, num2,
                  case
                    when num1 < 50 and num2 < 50 then 'Both lower then 50'
                    when num1 > 50 and num2 > 50 then 'Both numbers greater then 50'
                    when num1 = 50 then 'Exact value of 50'
*                    when datn1 eq cast( '20250101' as  ) then 'Another condition'
                    else 'Another situation'
                  end as number,

                  case num1
                    when 50 then 'Exact value of 50'
                    when 25 then 'Exact value of 25'
                    else 'Another situation'
                  end as number2
                  order by id
                  into table @data(lt_results).

    if sy-subrc eq 0.
      cl_demo_output=>display( lt_results ).
    endif.

  endmethod.

endclass.

start-of-selection.

  lcl_case=>main(  ).
