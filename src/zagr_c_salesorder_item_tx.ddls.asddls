@AbapCatalog.sqlViewName: 'ZAGR_C_SOI'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Item for transactional app'

@Search.searchable: true 
@UI.headerInfo.typeName: 'Sales Order Item'
@UI.headerInfo.title.value: 'SalesOrderItem'
 
@ObjectModel.transactionalProcessingDelegated: true
@ObjectModel.semanticKey: [ 'SalesOrder', 'SalesOrderItem' ]
@ObjectModel.representativeKey: 'SalesOrderItem'
@ObjectModel.createEnabled: true
@ObjectModel.updateEnabled: true
@ObjectModel.deleteEnabled: true


define view ZAGR_C_SALESORDER_ITEM_TX
  as select from ZAGR_I_SALESORDER_ITEM_TX 
  association [1..1] to ZAGR_C_SALESORDER_TX as _SalesOrder on $projection.SalesOrder = _SalesOrder.SalesOrder
{
      @Search.defaultSearchElement: true
      @ObjectModel.readOnly: true
      @UI.identification: {position: 10, importance: #HIGH}
      @UI.lineItem: {position: 10, importance: #HIGH }
      
  key ZAGR_I_SALESORDER_ITEM_TX.SalesOrder, 

      @Search.defaultSearchElement: true
      @ObjectModel.readOnly: true
      @UI.identification: {position: 20, importance: #HIGH}
      @UI.lineItem: {position: 20, importance: #HIGH}
  key ZAGR_I_SALESORDER_ITEM_TX.SalesOrderItem,

      @UI.identification: {position: 70, importance: #HIGH}
      @UI.lineItem: {position: 70, importance: #HIGH}
      ZAGR_I_SALESORDER_ITEM_TX.GrossAmount,

      @UI.identification: {position: 80, importance: #HIGH}
      @UI.lineItem: {position: 80, importance: #HIGH}
      ZAGR_I_SALESORDER_ITEM_TX.NetAmount,

      @UI.identification: {position: 90, importance: #HIGH}
      @UI.lineItem: {position: 90, importance: #HIGH}
      ZAGR_I_SALESORDER_ITEM_TX.TaxAmount,
      
      @UI.identification: {position: 100, importance: #HIGH}
      @UI.lineItem: {position: 100, importance: #HIGH}
      ZAGR_I_SALESORDER_ITEM_TX.CurrencyCode,

      @ObjectModel.association.type: [#TO_COMPOSITION_ROOT, #TO_COMPOSITION_PARENT]
      _SalesOrder
} 
 