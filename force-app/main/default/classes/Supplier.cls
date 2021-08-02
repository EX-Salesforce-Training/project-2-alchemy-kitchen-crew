public class Supplier {
    Supplier_Order__c cont = new Supplier_Order__c();
    public  Supplier_Order__c sup{get;set;}
    public List<Supplier_Order__c> s{get;set;}
    public List<Supplier_Order__c> lists = new List<Supplier_Order__c>();
    
    Public Supplier(){
        sup = new  Supplier_Order__c();
        s= new List<Supplier_Order__c>();
        s.add(cont);
    }
    public List<SelectOption> getStore(){
        List<SelectOption> listOption = new List<SelectOption>();
        List<Schema.PicklistEntry> listItems = Supplier_Order__c.Store__c.getDescribe().getPickListValues();
        for(Schema.PicklistEntry sc: listItems){
            listOption.add(new SelectOption(sc.getValue(), sc.getLabel()));
        }
       return ListOption;
    }
	
    public List<SelectOption> getItem(){
        List<SelectOption> listOption = new List<SelectOption>();
        List<Schema.PicklistEntry> listItems = Supplier_Order__c.Item__c.getDescribe().getPickListValues();
        for(Schema.PicklistEntry sc: listItems){
            listOption.add(new SelectOption(sc.getValue(), sc.getLabel()));
        }
        
        
        return ListOption;
    }
  
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
   public void getContact(){
      List< Supplier_Order__c> supers=[SELECT Name,Supplier__c, Store__c,Cost__c,Quantity__c, Order_Number__c,Total_Cost__c,
             Shipping_Address__c,Item__c FROM Supplier_Order__c ];  
        for(Supplier_Order__c c:supers ){
                Supplier_Order__c cnts= new Supplier_Order__c(); 
                cnts.Name = c.Name;
               // cnts.Supplier__c = c.Supplier__c;
                cnts.Store__c = c.Store__c;
                cnts.Cost__c = c.Cost__c;
                cnts.Quantity__c=c.Quantity__c;
                 cnts.Shipping_Address__c = c.Shipping_Address__c;
                 //cnts.Item__c = c.Item__c;
                s.add(cnts);   
        } }
    
   
    
}