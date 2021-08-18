/*
Title: ReceiptPageController
Author: Milan Winter
Date Updated: 8/17/21
Description: Apex Controller for the receipt page in the aura component. Grabs a list of the products for the customer's last transaction and sends
it to the javascript controller. It also has methods to get more info for a single customer and single product.
*/

public with sharing class ReceiptPageController {
    
    
    //Grabbing a list of productIds that can be iterated over in the receiptPage component
	@AuraEnabled
    public static List<String> getReceipts(String customerId) {
        String customer = customerId;
        List<String> productIds = new List<String>();
        String currentTransactionId = [SELECT Id FROM Transaction__c WHERE Customer__c = :customer ORDER BY createdDate DESC LIMIT 1][0].Id;
        
        List<Receipt__c> receiptsList = [SELECT Id, Product__c FROM Receipt__c WHERE Transaction__c = :currentTransactionId];
        for(receipt__c r : receiptsList){
            productIds.add(r.Product__c);
        }
        return productIds;
    }
    
    @AuraEnabled
    public static Product2 getProduct(String productId) {
        Product2 selectProduct;
        if(Schema.SObjectType.Product2.isAccessible()){
          selectProduct = [SELECT Id,Name,Price__c,ProductCode FROM Product2 WHERE Id = :productId][0];
           system.debug(selectProduct);
        }
      
        return selectProduct;
    }
    
    @AuraEnabled 
    public static Customer__c getCustomer(String customerId) {
        Customer__c customer = [SELECT Id,First_Name__c, Credit_Card_Type__c, Street_Address__c, City__c, State__c,
                               Zip__c FROM Customer__c WHERE Id = :customerId][0];
        return customer;
    }
}