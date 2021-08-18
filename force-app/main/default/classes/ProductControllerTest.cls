@isTest
private class ProductControllerTest {
    
    @isTest
    static void testGetReceipts() {
        // Making test data
    	Product2 test = new Product2(Name='Test1');
        Product2 test2 = new Product2(Name='Test2');
        insert test;
        insert test2;
        List<Id> listIds = new List<Id>();
        listIds.add(test.Id);
        listIds.add(test2.Id);
        
        //Testing the method
        List<Id> listProducts = ProductController.getAllProducts();
       	
        system.assertEquals(listIds, listProducts);
       	
    }
	
    @isTest
    static void testGetProduct() {
        //making test data
        Product2 test = new Product2(Name='Testing',Price__c=40);
        insert test;
        Id productId = test.Id;
        
       	//testing method
        Product2 testProduct = ProductController.getProduct(productId);
        system.assertEquals(test.Name, testProduct.Name);
        system.assertEquals(test.Price__c, testProduct.Price__c);
    }
    
    @isTest
    static void testNewTransaction() {
        
        //making test data
        Customer__c newCustomer = new Customer__c(First_Name__c='Mike');
        Store__c newStore = new Store__c(Name='TestingStore');
        insert newCustomer;
        insert newStore;
        
        //testing method
        ProductController.newTransaction(newCustomer.Id,newStore.Id);
        Transaction__c testTransaction = [SELECT ID,Customer__c,Store__c FROM Transaction__c][0];
       
        system.assertEquals(newCustomer.Id, testTransaction.Customer__c);
        system.assertEquals(newStore.Id, testTransaction.Store__c);
    }
    
    @isTest 
    static void newReceipts() {
        //making test data
        Customer__c testCustomer = new Customer__c();
        	insert testCustomer;
        Store__c newStore = new Store__c(Name='Test Store');
        	insert newStore;
        Product2 testProduct = new Product2(Name='Test Product');
        	insert testProduct;
        Integer quantity = 3;
        Transaction__c testTransaction = new Transaction__c(Store__c = newStore.Id, Customer__c = testCustomer.Id);
        Transaction__c testTransaction2 = new Transaction__c(Store__c = newStore.Id, Customer__c = testCustomer.Id);
        insert testTransaction;
        insert testTransaction2;
        
        //testing the method that the latest transaction got receipts linked to it
        ProductController.newReceipts(testCustomer.Id, testProduct.Id, quantity);
        List<Receipt__c> listReceipts = [SELECT Id,Transaction__c,Product__c FROM Receipt__c];
        Receipt__c testReceipt = listReceipts[0];
        system.assertEquals(listReceipts.size(), 3);
        system.assertEquals(testTransaction2.Id, testReceipt.Transaction__c);
        
    }
    
    
    
    
    
    
}