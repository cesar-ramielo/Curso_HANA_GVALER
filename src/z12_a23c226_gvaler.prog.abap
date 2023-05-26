*&---------------------------------------------------------------------*
*& Report z12_a23c226_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z12_a23c226_gvaler.

insert zgt_gvaler from table @( value #( ( employee_id = '00000001'
                                           name = 'Laura'
                                           last_name = 'Martínez'
                                           gender = 'Femenino' )
                                         ( employee_id = '00000002'
                                           name = 'Luis'
                                           last_name = 'Garcia'
                                           gender = 'Male' ) ) ).

select from zgt_gvaler as temporary
       join ztb_emp_logali as persistence
           on temporary~employee_id eq persistence~employee_number
       fields temporary~employee_id,
              persistence~name,
              persistence~last_name,
              persistence~gender
       into table @data(gt_employees).

delete from zgt_gvaler.

cl_demo_output=>display( gt_employees ).
