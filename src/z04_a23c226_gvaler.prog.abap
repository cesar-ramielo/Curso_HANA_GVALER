*&---------------------------------------------------------------------*
*& Report z04_a23c226_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z04_a23c226_gvaler.

types: begin of ty_empleado,
         nombre   type char30,
         posicion type char30,
         edad     type i,
       end of ty_empleado,
       tt_empleado type standard table of ty_empleado with key nombre.


data(gt_empleados) = value tt_empleado( ( nombre = 'Oscar' posicion = 'ABAP' edad = 34 )
                                        ( nombre = 'Carlos' posicion = 'FUNCIONAL' edad = 26 )
                                        ( nombre = 'Lorena' posicion = 'ABAP' edad = 32 )
                                        ( nombre = 'Erick' posicion = 'FUNCIONAL' edad = 37 )
                                        ( nombre = 'Samuel' posicion = 'ABAP' edad = 29 )
                                        ( nombre = 'Alicia' posicion = 'BASIS' edad = 24 ) ).

data: gv_edad_tot type i,
      gv_edad_avg type i.


loop at gt_empleados into data(ls_employee)
     group by ( posicion = ls_employee-posicion
                size     = group size
                index    = group index )
     ascending
     assigning field-symbol(<group>).

  clear gv_edad_tot.

* Salida a nivel de posición
  write: / |Indice: { <group>-index } Posición:  { <group>-posicion width = 10 }|
           & |Número de empleados de esta posición: { <group>-size }|.

* Miembros del grupo
  loop at group <group> assigning field-symbol(<ls_miembro>).
    gv_edad_tot += <ls_miembro>-edad.
    write: /20 <ls_miembro>-nombre.
  endloop.

*  Edad del grupo
   gv_edad_avg = gv_edad_tot / <group>-size.
   write: / |Edad media: { gv_edad_avg }|.

endloop.
