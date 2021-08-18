/*
Title: ProductController
Author: Milan Winter
Last Modified: 8/17/21
Description: Apex Controller for the Products Page Component which displays all the current products that can be added to the cart.
Also handles the Checkout portion of the page by creating a new transaction and then creating receipts connected to that transaction
and all the products in the user's cart.
*/

public with sharing class ProductController {
	
    // Grabbing a list of all product Ids to iterate over on productpage
    @AuraEnabled
    public static List<ID> getAllProducts() {
        List<Id> ids = new List<ID>();
        if(Schema.SObjectType.Product2.isAccessible()){
            for(Product2 p : [SELECT ID FROM Product2]){
                ids.add(p.ID);
            }
        }
        return ids;
    }
   
    // Getting Information on a single product to display prices in the carts
    @AuraEnabled
    public static Product2 getProduct(String Id) {
        Product2 product;
        if(Schema.SObjectType.Product2.isAccessible()){
            String ProductId = ID;
			 product = [SELECT Name, ProductCode,Price__c FROM Product2 WHERE Id = :ProductId];
        }
		
        return product;
    }
    
    // Creating a new Transaction when customers hit the checkout button so that new receipts can be create with the products to link to it
    @AuraEnabled
    public static String newTransaction(String customerId, String storeId) {
 		Transaction__c createTransaction = new Transaction__c();
        createTransaction.Store__c = storeId;
        createTransaction.Customer__c = customerId;
        try{
            insert createTransaction;
        }catch(Exception e) {
            system.debug(e);
        }
        return createTransaction.Id;
    }
    
    
    //Creating a new receipt for each product in the cart and then linking it to the recently created transaction from the above method
    @AuraEnabled
    public static void newReceipts(String customerId, String productId, Integer quantity) {
        Transaction__c currentTransaction = [SELECT Id FROM Transaction__c WHERE Customer__c = :customerId ORDER BY createdDate DESC LIMIT 1][0];
        system.debug(currentTransaction);
        List<Receipt__c> receipts = new List<Receipt__c>();
        String message;
        for(Integer i=0;i<quantity;i++) {
            Receipt__c newReceipt = new Receipt__c();
            newReceipt.Transaction__c = currentTransaction.Id;
            newReceipt.Product__c = productId;
            receipts.add(newReceipt);
        }
        
        try{
            insert receipts;
        } catch (Exception e) {
      		system.debug(e);
        }
    }
    
}