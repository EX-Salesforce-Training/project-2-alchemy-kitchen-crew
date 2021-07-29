/* Project 1
 * Author: Endalkachew Filfilu
 * Date: 07/28/2021
 * The intent: The supplier order is custom object
 * This class will access the Object and the fields
 * the task will be implementing the page that displays
   the fields  with customized view on visualforce page
*/

public class SuplierOrder {
    Supplier_Order__c sup= new Supplier_Order__c();
    public List<Supplier_Order__c> supplierLis = new List<Supplier_Order__c>();
    public List<Supplier_Order__c> spplier{get; set;}
    public SuplierOrder(){
        spplier =new List<Supplier_Order__c>();
        spplier.add(sup);
    }
    
    public void getFields(){
   List<Supplier_Order__c> supfields=[SELECT Shipping_Address__c,Name, Cost__c,Quantity__c FROM Supplier_Order__c];
        for(Supplier_Order__c spp: supfields){
            Supplier_Order__c suplier = new Supplier_Order__c();
            suplier.Name = spp.Name;
            supplierLis.add(suplier);
           
        }
        
    }
    
    
    
    
    

}