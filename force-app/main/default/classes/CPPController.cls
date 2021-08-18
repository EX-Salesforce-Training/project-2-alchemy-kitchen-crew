public class CPPController {

    @AuraEnabled
    public static String newCustomerId(String customerId) {
       // Customer__c createCustomerId = new Customer__c();
       // createCustomerId. = customerId;
          Customer__c[] recordCustomerId = [SELECT Id FROM Customer__c WHERE Name =:customerId LIMIT 1];
         String recordId = recordCustomerId[0].Id;
        
       /* try{
            //insert customerId;
        }catch(Exception e) {
            system.debug(e);
        } */
       return recordId;
    }
    
}