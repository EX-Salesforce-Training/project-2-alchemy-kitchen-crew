public with sharing class ProductController {
	
    
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
    
    @AuraEnabled
    public static Product2 getProduct(String Id) {
		String ProductId = ID;
        Product2 product = [SELECT Name, ProductCode,Price__c FROM Product2 WHERE Id = :ProductId];
        return product;
    }
    
    @AuraEnabled
    public static void makeTransactionReceipts(Map<Id,List<Id>> customerProductIdsMap) {
        
    }
}