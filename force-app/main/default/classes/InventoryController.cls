/**************************************************************
* InventoryController.apxc
* Author: Evan DeVizio
* Created: 8/16/21
* Modified: 8/16/21
* Purpose: Interact with Salesforce database to retrieve stores.
***************************************************************/
public with sharing class InventoryController {
	@AuraEnabled
    public static List<Store__c> getStores() {
        List<Store__c> storeList = new List<Store__c>();
        if(Schema.SObjectType.Store__c.isAccessible()) {
            for(Store__c store : [SELECT Id, Name, Store_Owner__c, Phone__c, Street_Address__c,
                                        City__c, State__c, Zip__c, Website__c FROM Store__c]) {
                                            
            	storeList.add(store);
            }
        } 
        else {
            throw new AuraHandledException('You do not have access to the Store object.');
        }
        return storeList;
    }
}