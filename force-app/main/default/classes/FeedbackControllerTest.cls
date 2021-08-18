/**************************************************************
* FeedbackControllerTest.apxc
* Author: Evan DeVizio
* Created: 8/16/21
* Modified: 8/17/21
***************************************************************/
@isTest
public class FeedbackControllerTest {
	
    @isTest
    public static void testFeedback(){
        Boolean pass = false;
        Feedback__c testFdbk = FeedbackControllerC.initFeedback();
        testFdbk.Feedback_Q5__c = 'TEST';
        insert(testFdbk);
        
        List<Feedback__c> queryResult = [SELECT Id, Feedback_Q5__c FROM Feedback__c WHERE Feedback_Q5__c = 'TEST' LIMIT 1];
        for(Feedback__c res : queryResult) {
            if(res.Feedback_Q5__c == testFdbk.Feedback_Q5__c) {
                pass = true;
            }
        }
        
        Feedback__c testFdbkNeg = new Feedback__c(Feedback_Q1__c='Google', Feedback_Q2__c='5', 
                                           Feedback_Q3__c='5', Feedback_Q4__c='5', 
                                           Feedback_Q5__c='This is a different comment.');      

        insert(testFdbkNeg);
		Feedback__c testFdbkNegResult = [SELECT Id, Feedback_Q5__c FROM Feedback__c WHERE Feedback_Q5__c = :testFdbkNeg.Feedback_Q5__c];
        system.debug(testFdbk.Feedback_Q5__c == testFdbkNegResult.Feedback_Q5__c);
        system.assert(pass);
        system.assertEquals(false, (testFdbk.Feedback_Q5__c == testFdbkNegResult.Feedback_Q5__c));
    }
}