@isTest
private class ReceiptPageControllerTest {
	
    @isTest
    static void testGetReceipts(){
         //making test data
        Customer__c testCustomer = new Customer__c();
        	insert testCustomer;
        Store__c newStore = new Store__c(Name='Test Store');
        	insert newStore;
        Product2 testProduct = new Product2(Name='Test Product');
        	insert testProduct;
        Integer quantity = 3;
         Transaction__c testTransaction = new Transaction__c(Store__c = newStore.Id, Customer__c = testCustomer.Id);
        insert testTransaction;
        ProductController.newReceipts(testCustomer.Id, testProduct.Id, quantity);
        
        //testing the method
        List<String> actualProductIds = ReceiptPageController.getReceipts(testCustomer.Id);
        system.assertEquals(3,actualProductIds.size());
        system.assertEquals(testProduct.Id, actualProductIds[0]);
    }
    
    
    @isTest
    static void testGetProduct() {
        // making test data
        Product2 testProduct = new Product2(Name='Test Product',Price__c = 25);
        insert testProduct;
        
        //testing the method
        Product2 methodProduct = ReceiptPageController.getProduct(testProduct.Id);
        
        system.assertEquals(testProduct.Id, methodProduct.Id);
        system.assertEquals(testProduct.Price__c, methodProduct.Price__c);
    }
    
    @isTest
    
    static void testGetCustomer() {
        //making test data
        Customer__c newCustomer = new Customer__c(First_Name__c = 'Bobby',City__c ='San Francisco');
        insert newCustomer;
        
        //testing the method
      	Customer__c testCustomer = ReceiptPageController.getCustomer(newCustomer.Id);
        system.assertEquals(newCustomer.Id, testCustomer.Id);
        system.assertEquals('San Francisco',testCustomer.City__c);
    }
    
    
    
    
    
    
    
    
    
    
    
}