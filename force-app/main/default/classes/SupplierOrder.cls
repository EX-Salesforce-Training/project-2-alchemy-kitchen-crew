/*--------------- Project 1------------------------------------------
 * Author: Endalkachew Filfilu
 * Date: 07/28/2021
 * The intent: The supplier order is custom object
 * This class will access the custom Object and its fields.
 * The task will be implementing the visualpage that 
 * allowS to create a new record and submit. It also allows the records
   appear on the same visualforce page.
	
-----------------------------------------------------------------------
*/

public class SupplierOrder {
    INTEGER i=0;
    Supplier_Order__c cont = new Supplier_Order__c();
   //this is used for insrting data into the custom object
    public  Supplier_Order__c sup{get;set;}
    //This is used to pool data from DB
    public List<Supplier_Order__c> s{get;set;}
    //This is used for pooling data.
    public List<Supplier_Order__c> lists = new List<Supplier_Order__c>();
    
    Public SupplierOrder (){
        sup = new  Supplier_Order__c();
        s= new List<Supplier_Order__c>();
        s.add(cont);
    }
/*
 * --------------------------------------------------------------
 * The store has a look-up relationship with supplier
 * it will be give picklists so user can choose
 * ------------------------------------------------------------------
*/
    public List<SelectOption> getStore(){
        List<SelectOption> listOption = new List<SelectOption>();
        List<Schema.PicklistEntry> listItems = Supplier_Order__c.Store__c.getDescribe().getPickListValues();
        for(Schema.PicklistEntry sc: listItems){
            listOption.add(new SelectOption(sc.getValue(), sc.getLabel()));
        }
       return ListOption;
    }
/*
 * --------------------------------------------------------------
 * The Item custom object ha pick-list type and can allow user to
 * pick Items.
 * ------------------------------------------------------------------
*/	
    public List<SelectOption> getItem(){
        List<SelectOption> listOption = new List<SelectOption>();
        List<Schema.PicklistEntry> listItems = Supplier_Order__c.Item__c.getDescribe().getPickListValues();
        for(Schema.PicklistEntry sc: listItems){
            listOption.add(new SelectOption(sc.getValue(), sc.getLabel()));
        }
        
        
        return ListOption;
    }
/*
 * --------------------------------------------------------------
 * The Supplier has a master detail with store
 * it will be give picklists so user can choose suppliers.
 * ------------------------------------------------------------------
*/  
    public List<SelectOption> getSupplier(){
        List<SelectOption> listOption = new List<SelectOption>();
        List<Schema.PicklistEntry> listItems = Supplier_Order__c.Supplier__c.getDescribe().getPickListValues();
        for(Schema.PicklistEntry sc: listItems){
            listOption.add(new SelectOption(sc.getValue(), sc.getLabel()));
        }
        
        return ListOption;
    }
    
    public List<SelectOption> getTax(){
        List<SelectOption> listOption = new List<SelectOption>();
        List<Schema.PicklistEntry> listItems = Supplier_Order__c.Tax_Rate__c.getDescribe().getPickListValues();
        for(Schema.PicklistEntry sc: listItems){
            listOption.add(new SelectOption(sc.getValue(), sc.getLabel()));
        }
        
        return ListOption;
    }
  
        
     public void getData(){
             insert sup;
        
    }
//---------------this can list record on the same visualforce page-----------------------------------------------------------------------
    
    public void getContact(){
      List< Supplier_Order__c> supers=[SELECT Name,Supplier__c, Store__c,
                                       Tax_Rate__c,Cost__c,Quantity__c, 
                                       Order_Number__c,Total_Cost__c,Shipping_Address__c,
                                       Item__c FROM Supplier_Order__c ];  
        for(Supplier_Order__c c:supers ){
                Supplier_Order__c cnts= new Supplier_Order__c(); 
                cnts.Name = c.Name;
                cnts.Supplier__c = c.Supplier__c;
                cnts.Store__c = c.Store__c;
                cnts.Cost__c = c.Cost__c;
            	cnts.Tax_Rate__c = c.Tax_Rate__c;
                cnts.Quantity__c=c.Quantity__c;
                cnts.Item__c=c.Item__c;
                cnts.Shipping_Address__c = c.Shipping_Address__c;
                
                lists.add(cnts);   
        } 
//---data can be inserted into the list one at a time--------------
   if (i < lists.size()){
       s.add(lists[i]);
       i++;
        
    }}

    
}