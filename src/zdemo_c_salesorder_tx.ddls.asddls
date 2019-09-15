  @AbapCatalog.sqlViewName: 'ZAGRDEMO_C_SO'
  @AbapCatalog.compiler.compareFilter: true
  @AccessControl.authorizationCheck: #NOT_REQUIRED
  @EndUserText.label: 'Sales Order for transactional app'
  @Search.searchable: true
  @OData.publish: true
        
  @ObjectModel.transactionalProcessingDelegated: true
  @ObjectModel.semanticKey: 'SalesOrder' 
  @ObjectModel.representativeKey: 'SalesOrder'
                
  @ObjectModel.createEnabled: true
  @ObjectModel.deleteEnabled: true
  @ObjectModel.updateEnabled: true
  
  @UI.headerInfo: { typeName: 'Sales Order' } 
                
  define view ZDEMO_C_SalesOrder_TX
                
        as select from ZAGRDEMO_I_SalesOrder_TX as Document
  association [0..*] to ZDEMO_C_SALESORDER_ITEM_TX as _Item on $projection.SalesOrder = _Item.SalesOrder         
  {  

    @UI.lineItem.position: 5
    @UI.lineItem: 
    [
      { type: #FOR_ACTION, position: 1, dataAction: 'BOPF:SET_TO_PAID', label: 'Set Paid' }
    ]   

      @UI.identification: {position: 10, importance: #HIGH}
      @UI.selectionField: {position: 10}                
        key Document.SalesOrder as SalesOrder,
                
        @UI.lineItem.position: 20
        @UI.identification.position: 20
        Document.BusinessPartner,
                
        Document.CurrencyCode,
                
        @UI.lineItem.position: 50
        @UI.identification.position: 50
        Document.GrossAmount,
                
        @UI.lineItem.position: 60
                
        @UI.identification.position: 60
        Document.NetAmount,
                
        @UI.lineItem.position: 30
        @UI.selectionField.position: 30
        @UI.identification.position: 30
        Document.BillingStatus,
                
        @UI.lineItem.position: 40
        @UI.selectionField.position: 40
        @UI.identification.position: 40
        Document.OverallStatus,
                
      @UI.fieldGroup: [{qualifier: 'Item', groupLabel: 'Item', position: 50, importance: #HIGH}]
      @ObjectModel.association.type: #TO_COMPOSITION_CHILD
      _Item           
                
  }                        
