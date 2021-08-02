@isTest
public class TransactionControllerTest {
	@isTest
    static void TransControllerTest() {
        //Create test data
        Store__c s = new Store__c(Name = 'testStore');
        insert s;
        
        Transaction__c t = new Transaction__c();
        t.Date_Time__c = Datetime.now();
        t.Store__c = s.Id;
        
        //Start test
        System.Test.startTest();
        
        Database.SaveResult sr = Database.insert(t);
        
        //Query transaction record name
       	List<Transaction__c> n = [SELECT Name FROM Transaction__c LIMIT 1];
        
        //Create an instance of TransactionController
        TransactionController tc = new TransactionController();
        tc.myInput = n[0].Name; //Pass in queried transaction name
        tc.search(); //Call search method in controller
        
        //Verify subtotal
        system.assertEquals(null, tc.subTotal);
        
        //End test
        System.Test.stopTest();
        
    }
}