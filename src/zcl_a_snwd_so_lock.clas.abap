class ZCL_A_SNWD_SO_LOCK definition
  public
  inheriting from /BOBF/CL_LIB_A_LOCK_ACTIVE
  final
  create public .

public section.

  methods /BOBF/IF_LIB_LOCK_ACTIVE~LOCK_ACTIVE_ENTITY
    redefinition .
protected section.
private section.
ENDCLASS.



CLASS ZCL_A_SNWD_SO_LOCK IMPLEMENTATION.


  method /BOBF/IF_LIB_LOCK_ACTIVE~LOCK_ACTIVE_ENTITY.
*CALL METHOD SUPER->/BOBF/IF_LIB_LOCK_ACTIVE~LOCK_ACTIVE_ENTITY
*  EXPORTING
*    IS_CTX        =
*    IT_KEY        =
*    IO_READ       =
**  IMPORTING
**    et_failed_key =
*    .
  endmethod.
ENDCLASS.
