@AbapCatalog.sqlViewName: 'ZAGR_I_SO'
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
                
                
define view ZAGR_I_SALESORDER_TX  
                
    as select from zagrtab_so as SalesOrder  -- the sales order table is the data source for this view
    association [0..*] to ZAGR_I_SALESORDER_ITEM_TX        as _Item on $projection.SalesOrder = _Item.SalesOrder
                
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
                
    SalesOrder.billingstatus            as BillingStatus, 
                
    SalesOrder.overallstatus            as OverallStatus,
    SalesOrder.lifecyclestatus          as LifecycleStatus,                
                
               
    /* Associations */ 
@ObjectModel.association.type: #TO_COMPOSITION_CHILD
      _Item
         
}
