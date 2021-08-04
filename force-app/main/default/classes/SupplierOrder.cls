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
    public String selct {get;set;}
    public String selected {get;set;}
    public String selecto {get;set;}
    
    public  Supplier_Order__c sup{get;set;} 
  	public List<Supplier_Order__c> s{get;set;}
    
    Supplier_Order__c cont = new Supplier_Order__c();
    public List<Supplier_Order__c> lists = new List<Supplier_Order__c>();
    
    Public SupplierOrder (){
        sup = new  Supplier_Order__c();
        s= new List<Supplier_Order__c>();
        s.add(cont);
    }
/*
 * --------------------------------------------------------------
 * The store has a look-up relationship with supplier
 * it will be given picklists so user can choose
 * ------------------------------------------------------------------
*/
   public List<selectOption> getStores(){
        List<selectOption> sel = new List<selectOption>();
        List<Store__c> Listss = new List<Store__c>();
          Listss= [SELECT Id,Name FROM Store__c];
                  for(Store__c r: Listss){
                      sel.add(new selectOption(r.Id,r.Name));
                  }
            
       return sel;
    }
/*
 * --------------------------------------------------------------
 * The Supplier has a master detail with store
 * it will be give picklists so user can choose suppliers.
 * ------------------------------------------------------------------
*/   
     public List<selectOption> getSupplier(){
        List<selectOption> sel = new List<selectOption>();
        List<Supplier__c> Listsed = new List<Supplier__c>();
          Listsed= [SELECT Id,Name FROM Supplier__c];
                  for(Supplier__c r: Listsed){
                      sel.add(new selectOption(r.Id,r.Name));
                  }
            
       return sel;
    }
/*
 * --------------------------------------------------------------
 * The Item custom object has pick-list type and can allow user to
 * pick Items.
 * ------------------------------------------------------------------
*/	
    public List<SelectOption> getItem(){
          List<selectOption> sel = new List<selectOption>();
        List<Product2> Listso = new List<Product2>();
          Listso= [SELECT Id,Name FROM Product2];
                  for(Product2 r: Listso){
                      sel.add(new selectOption(r.Id,r.Name));
                  }
            
       return sel;
       
    }   
     public List<Supplier_Order__c> getTax(){
          List<Supplier_Order__c> sel = new List<Supplier_Order__c>();
        List< Supplier_Order__c> Listso = new List<Supplier_Order__c>();
          Listso= [SELECT Tax_Rate__c FROM Supplier_Order__c];
                  for( Supplier_Order__c r: Listso){
                      sel.add(r);
                  }
            
       return sel;
       
    }
    public List<Product2> getItems(){
          List<Product2> sel = new List<Product2>();
        List<Product2> Listso = new List<Product2>();
          Listso= [SELECT Name FROM Product2];
                  for(Product2 r: Listso){
                      sel.add(r);
                  }
            
       return sel;
       
    }   
    
	public void getData(){
             insert sup;
        
    }
//---------------this can list record on the same visualforce page-----------------------------------------------------------------------
     //
    public void getContact(){
      List< Supplier_Order__c> supers=[SELECT Name, Store__c,Order_Number__c,Tax_Rate__c,Cost__c,Quantity__c,Total_Cost__c,
                                       Shipping_Address__c,Supplier__c,Item__c FROM Supplier_Order__c ];  
       
        for(Supplier_Order__c c:supers ){
                Supplier_Order__c cnts= new Supplier_Order__c(); 
                cnts.Name = c.Name;
                cnts.Supplier__c = c.Supplier__c;
                cnts.Store__c = c.Store__c;
                cnts.Cost__c = c.Cost__c;
            	cnts.Tax_Rate__c = c.Tax_Rate__c;
                cnts.Quantity__c=c.Quantity__c;
                cnts.Item__c=c.Item__c;
                //cnts.Order_Number__c = c.Order_Number__c;
                cnts.Shipping_Address__c = c.Shipping_Address__c;
                
                lists.add(cnts);   
        } 
//---data can be inserted into the list one at a time--------------
   if (i < lists.size()){
       s.add(lists[i]);
       i++;
        
    }}

    
}