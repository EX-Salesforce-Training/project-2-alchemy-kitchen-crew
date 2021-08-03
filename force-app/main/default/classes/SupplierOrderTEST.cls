@istest
public class SupplierOrderTEST {
  
static testMethod void testMethod1(){ // Single Record
         Supplier_Order__c testSupplier = new Supplier_Order__c();
         testSupplier.Name= 'Test1 Name';
         testSupplier.Shipping_Address__c= 'Test1 shipping address';
         testSupplier.Tax_Rate__c= 9;
         testSupplier.Cost__c= 20;
         testSupplier.Quantity__c= 5;
         insert testSupplier;
 Test.startTest();
    Supplier_Order__c c2 = new  Supplier_Order__c(Name='Test1 Name', 
                                                    Shipping_Address__c= 'Test1 shipping address',
                                                    Tax_Rate__c= 9,Cost__c= 20,Quantity__c= 5
                                                   );
        Database.SaveResult sr = Database.insert(c2, false);
        Integer numFailed =0;
        if(!sr.isSuccess()){
            numFailed = 1;
        }
        System.assertEquals(1, numFailed);
    pageReference pageref =Page.supplierPage;
    pageref.getParameters().put('id', String.valueOf(testSupplier.Id));
    Test.setCurrentPage(pageref);
    SupplierOrder testSupplierOrder = new SupplierOrder(); 
    testSupplierOrder.getContact();
    testSupplierOrder.getData();
    testSupplierOrder.getItem();
    testSupplierOrder.getStore();
    testSupplierOrder.getSupplier();
    testSupplierOrder.getTax();
    Test.stopTest();
    }
    //Bulk test will fail for two reasons one is the duplication second
    //the validation rule for Tax Rate is set to be less than 10%, this will increase the tax rate
    // >10% then the test fails.
    static testMethod void BULKtestMethod2(){ //BULK Record
        List<Supplier_Order__c > supList = new List<Supplier_Order__c >();
        List<Supplier_Order__c > dupl = new List<Supplier_Order__c >();
        for(Integer i =0; i <295; i++){
            if(i<195){
    supList.add(new Supplier_Order__c (Name ='Test' + i,Cost__c= 50, Quantity__c= 20 + i,Tax_Rate__c= 9 , 
                                                   Shipping_Address__c='12345 H street'+ i
                                                 ) );
       }
            else{
     dupl.add(new Supplier_Order__c (Name ='Test' + i,Cost__c= 50, Quantity__c= 20 + i,
                                                 Tax_Rate__c= 9+i ,Shipping_Address__c='12345 H street'+ i
                                                 ) );}
        }
         insert supList; 
 Test.startTest();
        List<Database.SaveResult> result = Database.insert(dupl, false);
        Integer numFailed =0;
        for(Database.SaveResult sr : result){
            if(!sr.isSuccess()){
                system.debug('Error: Not inserted');
            }}
       // System.assertEquals(100, numFailed);
         pageReference pageref =Page.supplierPage;
         pageref.getParameters().put('id', String.valueOf(supList));
         Test.setCurrentPage(pageref);
         SupplierOrder testSupplierOrder2 = new SupplierOrder(); 
    testSupplierOrder2.getContact();
    testSupplierOrder2.getData();
    testSupplierOrder2.getItem();
    testSupplierOrder2.getStore();
    testSupplierOrder2.getSupplier();
    testSupplierOrder2.getTax();
Test.stopTest();
    }

}