public without sharing class ApexSecurityExample{
    public ApexSecurityExample(){
        List<Contact> bob = [SELECT Name, CreditCard, SocialSecurity, SecretStuff FROM Contact];


    }
    List<Account> accountList = [SELECT Id, Name, AnnualRevenue FROM Account WITH SECURITY_ENFORCED];

    public void stripInaccessableMethod(){
        SObjectAccessDecision securityDecision = Security.stripInaccessible(AccessType.READABLE, [SELECT Id, Name, AnnualRevenue FROM Account]);
        system.debug(securityDecision);

        List<Contact> bob = new List<Contact>();
        bob.add(new Contact(lastname='Smith', firstname='Bob'));


        SObjectAccessDecision securityDecisionTwo = Security.stripInaccessible(AccessType.CREATABLE bob);

        
    }

    public void schemaClassExamples(){
        if(Schema.SObjectType.Case.isAccessible()){
            List<Case> caseList = [SELECT subject FROM Case];
        }
        if(Schema.SObjectType.Case.fields.status.isUpdateable()){
            //Logic Here
        }
    }
}