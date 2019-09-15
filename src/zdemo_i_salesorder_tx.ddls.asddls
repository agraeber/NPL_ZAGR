
@AbapCatalog.sqlViewName: 'ZAGRDEMO_I_SO'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order for transactional app' 

@Search.searchable: true
@ObjectModel.modelCategory: #BUSINESS_OBJECT 
@ObjectModel.transactionalProcessingEnabled: true    
@ObjectModel.writeActivePersistence: 'ZAGRTAB_SO' 
@ObjectModel.semanticKey: 'SalesOrder'
@ObjectModel.representativeKey: 'SalesOrder'
@ObjectModel.compositionRoot: true
                
@ObjectModel.createEnabled: true
@ObjectModel.deleteEnabled: true 
@ObjectModel.updateEnabled: true 
                
                
define view ZAGRDEMO_I_SalesOrder_TX  
                
    as select from zagrtab_so as SalesOrder  -- the sales order table is the data source for this view
    association [0..*] to Zdemo_I_Salesorder_Item_tx        as _Item on $projection.SalesOrder = _Item.SalesOrder
                
{        
      @Search.defaultSearchElement: true
    key SalesOrder.salesorder           as SalesOrder, 
                
    SalesOrder.businesspartner          as BusinessPartner,       
                
    @Semantics.currencyCode: true
    SalesOrder.currencycode             as CurrencyCode, 
                
    @Semantics.amount.currencyCode: 'CurrencyCode'
    SalesOrder.grossamount              as GrossAmount, 
                
    @Semantics.amount.currencyCode: 'CurrencyCode'
    SalesOrder.netamount                as NetAmount, 
                
    @ObjectModel.foreignKey.association: '_BillingStatus'
    SalesOrder.billingstatus            as BillingStatus, 
                
    @ObjectModel.foreignKey.association: '_OverallStatus'
    SalesOrder.overallstatus            as OverallStatus,
                
                
    /* Associations */ 
@ObjectModel.association.type: #TO_COMPOSITION_CHILD
      _Item
         
}
