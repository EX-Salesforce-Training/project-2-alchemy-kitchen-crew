public with sharing class FeedbackControllerC {
    @AuraEnabled
    public static Feedback__c initFeedback() {
        Feedback__c Fdbk = new Feedback__c(Feedback_Q1__c='Google', Feedback_Q2__c='5', 
                                           Feedback_Q3__c='5', Feedback_Q4__c='5', 
                                           Feedback_Q5__c=''); 
        return Fdbk;
    }
}