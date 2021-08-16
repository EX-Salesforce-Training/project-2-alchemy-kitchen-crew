/**************************************************************
* SupplierController.apxc
* Author: Evan DeVizio
* Created: 8/10/21
* Modified: 8/15/21
***************************************************************/
public with sharing class SupplierController {
    
    @AuraEnabled
    public static List<Supplier__c> getSupplierObjs() {
        List<Supplier__c> suppObjList = new List<Supplier__c>();
        if(Schema.SObjectType.Supplier__c.isAccessible()) {
            for(Supplier__c supplier : [SELECT Id, Name, Email__c, Phone__c, Street_Address__c,
                                        City__c, State__c, Zip__c, Website__c FROM Supplier__c]) {
                                            
                suppObjList.add(supplier);
            }
        } 
        else {
            throw new AuraHandledException('You do not have access to the Supplier object.');
        }
        return suppObjList;
    }
    
    @AuraEnabled
    public static List<Supplier_Order__c> getSupplierOrders() {
        List<Supplier_Order__c> suppOrderList = new List<Supplier_Order__c>();
        if(Schema.SObjectType.Supplier_Order__c.isAccessible()) {
            for(Supplier_Order__c suppOrder : [SELECT Name, Store__c, Cost__c FROM Supplier_Order__c]) {
                suppOrderList.add(suppOrder);
            }
        } 
        else {
            throw new AuraHandledException('You do not have access to the Supplier Order object.');
        }
        return suppOrderList;
    }
}