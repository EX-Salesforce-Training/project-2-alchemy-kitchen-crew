@isTest
public class CPPTest {

    @isTest
    static void CustomerPurchasePageTest() {
       String customerId= 'Customer-00000';
       Customer__c testCustomer = new Customer__c();
       testCustomer.Id = 'TEST'; 
       testCustomer.First_Name__c = 'Test_firstName';
        testCustomer.Last_Name__c = 'Test_lastName';
        insert(testCustomer);
        
        Customer__c[] queryResult = [SELECT Id FROM Customer__c WHERE First_Name__c = 'Test_firstName' LIMIT 1];
         String recordIdTest = queryResult[0].Id;
        
        
        //Start the Test
       String recordId = CPPController.newCustomerId(recordIdTest);
        System.assertEquals(recordIdTest, testCustomer.Id);
        
        

        
        
    }
    
}