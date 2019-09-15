class ZCL_A_SNWD_SO_SET_SUM definition
  public
  inheriting from /BOBF/CL_LIB_A_SUPERCLASS
  final
  create public .

public section.

  methods /BOBF/IF_FRW_ACTION~EXECUTE
    redefinition .
protected section.
private section.
ENDCLASS.



CLASS ZCL_A_SNWD_SO_SET_SUM IMPLEMENTATION.


  METHOD /bobf/if_frw_action~execute.

    BREAK-POINT.
*    CASE is_ctx-act_key.

        "Action - Set overall status
*      WHEN zif_demo_i_salesorder_c=>sc_action-zdemo_i_salesorder-set_lifecycle_status_to_paid.

*    ENDCASE.
  ENDMETHOD.
ENDCLASS.
