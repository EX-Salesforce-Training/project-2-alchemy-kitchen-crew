/**************************************************************
* FeedbackControllerApex.apxc
* Author: Evan DeVizio
* Created: 8/16/21
* Modified: 8/16/21
***************************************************************/
public with sharing class FeedbackControllerApex {

    @AuraEnabled
    public static Feedback__c initializeFeedback() {
    	return new Feedback__c();
    }
}