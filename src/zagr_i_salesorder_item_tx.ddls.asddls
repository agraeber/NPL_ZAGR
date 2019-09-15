@AbapCatalog.sqlViewName: 'ZAGR_I_SOI'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Positions for transactional app'
@Search.searchable: true

@ObjectModel.writeActivePersistence: 'ZAGRTAB_SOI'
@ObjectModel.semanticKey: ['SalesOrder', 'SalesOrderItem'] 
@ObjectModel.representativeKey: 'SalesOrderItem'
               
@ObjectModel.createEnabled: true
@ObjectModel.deleteEnabled: true 
@ObjectModel.updateEnabled: true 


define view ZAGR_I_SALESORDER_ITEM_TX

  as select from zagrtab_soi as Item
  association [1..1] to ZAGR_I_SALESORDER_TX  as _SalesOrder on $projection.SalesOrder = _SalesOrder.SalesOrder

{
      @Search.defaultSearchElement: true
  key Item.salesorder     as SalesOrder,

      @Search.defaultSearchElement: true
  key Item.salesorderitem as SalesOrderItem,

      @Search.defaultSearchElement: true
      Item.productid        as ProductID,

      Item.currencycode     as CurrencyCode,
      Item.grossamount      as GrossAmount,
      Item.netamount        as NetAmount,
      Item.taxamount        as TaxAmount,

      @ObjectModel.association.type: [#TO_COMPOSITION_PARENT,#TO_COMPOSITION_ROOT]
      _SalesOrder
} 
 