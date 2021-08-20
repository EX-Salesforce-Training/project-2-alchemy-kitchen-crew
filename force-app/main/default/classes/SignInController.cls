public class SignInController {

    
    @AuraEnabled
    public static sObject checkEmailPassword(String email, String password) {
		
        Boolean isVerified = false;
        String checkPassword;
        sObject loggedIn;
        String searchQuery = 'FIND \'' + email + '\'IN ALL FIELDS RETURNING Customer__c(Id,Email__c,First_Name__c, Credit_Card_Type__c, Password__c), Employee__c(Id,Email__c,First_Name__c, Password__c)';  
        List<List<Sobject>> results = search.query(searchQuery);
        if(results[0].size() != 0) {
           Customer__c[] searchCustomers = (Customer__c[])results[0];
            checkPassword = searchCustomers[0].Password__c;
            if(checkPassword == password) {
                loggedIn = searchCustomers[0];
            }
        } else if(results[1].size() != 0) {
          Employee__c[] searchEmployees = (Employee__c[])results[1];
            checkPassword = searchEmployees[0].Password__c;
             if(checkPassword == password) {
                loggedIn = searchEmployees[0];
        	}
        }
		system.debug(loggedIn);
        return loggedIn;
    }
    

   
}