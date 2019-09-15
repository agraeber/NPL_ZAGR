class ZCL_AGR_A_SET_TO_PAID definition
  public
  inheriting from /BOBF/CL_LIB_A_SUPERCL_SIMPLE
  final
  create public .

public section.

  methods /BOBF/IF_FRW_ACTION~EXECUTE
    redefinition .
protected section.
private section.
ENDCLASS.



CLASS ZCL_AGR_A_SET_TO_PAID IMPLEMENTATION.


  METHOD /bobf/if_frw_action~execute.
    CASE is_ctx-act_key.

        "Action - Set overall status
      WHEN zif_agr_i_salesorder_tx_c=>sc_action-zagr_i_salesorder_tx-set_to_paid.
        " Get output structure of Action
        DATA(lt_sales_order) = VALUE ztagr_i_salesorder_tx( ).

        "Read UI clicked sale order
        io_read->retrieve(
          EXPORTING
            iv_node                 =  is_ctx-node_key   " BO Node Name
            it_key                  =  it_key            " BO Key
          IMPORTING
            et_data                 =  lt_sales_order ).   " Data Return Structure

        "Assuming single instance for a action
        READ TABLE lt_sales_order ASSIGNING FIELD-SYMBOL(<fs_sales_order>) INDEX 1.
        IF sy-subrc = 0.
          "Set the over all status to Paid ie 'P'
          IF <fs_sales_order>-lifecyclestatus = 'P'.
            <fs_sales_order>-lifecyclestatus  = 'X'.
          ELSE.
            <fs_sales_order>-lifecyclestatus  = 'P'.
          ENDIF.
        ENDIF.

        "Now update the BO instance
        io_modify->update(
          EXPORTING
            iv_node           = is_ctx-node_key    " Node
            iv_key            = <fs_sales_order>-key    " Key
            iv_root_key       = <fs_sales_order>-root_key     " NodeID
            is_data           = REF #( <fs_sales_order>-node_data )    " Data
            it_changed_fields = VALUE #(
                                ( zif_agr_i_salesorder_tx_c=>sc_node_attribute-zagr_i_salesorder_tx-lifecyclestatus ) )
                        ).

        et_data = lt_sales_order.

      WHEN OTHERS.
        "Nothing

    ENDCASE.
  ENDMETHOD.
ENDCLASS.
