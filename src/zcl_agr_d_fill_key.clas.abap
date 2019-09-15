CLASS zcl_agr_d_fill_key DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_d_supercl_simple
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS /bobf/if_frw_determination~execute
        REDEFINITION .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_AGR_D_FILL_KEY IMPLEMENTATION.


  METHOD /bobf/if_frw_determination~execute.
*      IS_CTX type /BOBF/S_FRW_CTX_DET
*      !IT_KEY type /BOBF/T_FRW_KEY
*      !IO_READ type ref to /BOBF/IF_FRW_READ
*      !IO_MODIFY

    DATA lt_root_data  TYPE        ztagr_i_salesorder_tx.
    DATA ls_root_data  TYPE        zsagr_i_salesorder_tx.

    DATA lt_all_sales_items_data  TYPE        ztagr_i_salesorder_item_tx.
    DATA ls_all_sales_items_data  TYPE        zsagr_i_salesorder_item_tx.

    DATA lt_current_sales_order_item  TYPE        ztagr_i_salesorder_item_tx.
    DATA lr_sales_order_item_data  TYPE REF TO zsagr_i_salesorder_item_tx.
    DATA: lt_root_key TYPE /bobf/t_frw_key.

    IF is_ctx-node_key = zif_agr_i_salesorder_tx_c=>sc_node-zagr_i_salesorder_item_tx.

      io_read->get_root_key(
        EXPORTING
          iv_node         = zif_agr_i_salesorder_tx_c=>sc_node-zagr_i_salesorder_item_tx
          it_key          = it_key
        IMPORTING
          et_target_key   = lt_root_key  ).

      io_read->retrieve(
        EXPORTING
          iv_node = zif_agr_i_salesorder_tx_c=>sc_node-zagr_i_salesorder_tx
          it_key  = lt_root_key
        IMPORTING
          et_data = lt_root_data ).

      READ TABLE lt_root_data INDEX 1 INTO ls_root_data.
**********************************************************************

      io_read->retrieve(
        EXPORTING
          iv_node                 =  is_ctx-node_key   " BO Node Name
          it_key                  =  it_key            " BO Key
        IMPORTING
          et_data                 =  lt_current_sales_order_item ).   " Data Return Structure


      LOOP AT lt_current_sales_order_item REFERENCE INTO lr_sales_order_item_data.
        IF lr_sales_order_item_data->salesorder IS INITIAL.

          io_read->retrieve_by_association(
            EXPORTING
              iv_node         = zif_agr_i_salesorder_tx_c=>sc_node-zagr_i_salesorder_tx
              it_key          = lt_root_key
              iv_association  = zif_agr_i_salesorder_tx_c=>sc_association-zagr_i_salesorder_tx-_item
*            is_parameters           =
*            it_filtered_attributes  =
              iv_fill_data            = abap_true
*            iv_before_image         = ABAP_FALSE
*            it_requested_attributes =
        IMPORTING
          et_data                 = lt_all_sales_items_data ).

          IF lines( lt_all_sales_items_data ) <> 0.
            SORT lt_all_sales_items_data  BY salesorder salesorderitem.
            LOOP AT lt_all_sales_items_data INTO ls_all_sales_items_data WHERE salesorderitem IS NOT INITIAL.
            ENDLOOP.

            lr_sales_order_item_data->salesorder     = ls_root_data-salesorder.
            lr_sales_order_item_data->salesorderitem = ls_all_sales_items_data-salesorderitem + 10.
            CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
              EXPORTING
                input  = lr_sales_order_item_data->salesorderitem
              IMPORTING
                output = lr_sales_order_item_data->salesorderitem.



            io_modify->update(
              EXPORTING
                iv_node           = is_ctx-node_key    " Node
                iv_key            = lr_sales_order_item_data->key
                is_data           = lr_sales_order_item_data ).
          ENDIF.
        ENDIF.
      ENDLOOP.

    ENDIF.
*    " Get output structure of Action
*    DATA(lt_sales_order) = VALUE ztagr_i_salesorder_tx( ).
*
*    "Read UI clicked sale order
*    io_read->retrieve(
*      EXPORTING
*        iv_node                 =  is_ctx-node_key   " BO Node Name
*        it_key                  =  it_key            " BO Key
*      IMPORTING
*        et_data                 =  lt_sales_order ).   " Data Return Structure
*
*    "Assuming single instance for a action
*    READ TABLE lt_sales_order ASSIGNING FIELD-SYMBOL(<fs_sales_order>) INDEX 1.
*    IF sy-subrc = 0.
*      "Set the over all status to Paid ie 'P'
*      IF <fs_sales_order>-lifecyclestatus = 'P'.
*        <fs_sales_order>-lifecyclestatus  = 'X'.
*      ELSE.
*        <fs_sales_order>-lifecyclestatus  = 'P'.
*      ENDIF.
*    ENDIF.
*
*    "Now update the BO instance
*    io_modify->update(
*      EXPORTING
*        iv_node           = is_ctx-node_key    " Node
*        iv_key            = <fs_sales_order>-key    " Key
*        iv_root_key       = <fs_sales_order>-root_key     " NodeID
*        is_data           = REF #( <fs_sales_order>-node_data )    " Data
*        it_changed_fields = VALUE #(
*                            ( zif_agr_i_salesorder_tx_c=>sc_node_attribute-zagr_i_salesorder_tx-lifecyclestatus ) )
*                    ).
*
*    et_data = lt_sales_order.



  ENDMETHOD.
ENDCLASS.
