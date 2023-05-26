@AbapCatalog.sqlViewName: 'Z15VA23GV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Parameters as Elements'
define view z15_cds_a23c226_gvaler
  with parameters
    p_param1 : char10,
    p_param2 : char10
  as select from scarr
{
  key carrid,
      :p_param1                                                               as Param1Element,
      $parameters.p_param2                                                    as Param2Element,
      concat_with_space($parameters.p_param1, concat(:p_param2, carrname), 5) as ConcatElem

}
