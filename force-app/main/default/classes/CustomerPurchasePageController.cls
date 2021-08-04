/*--------------------------------------------------------
Title: CustomerPurchasePageController
Author: Dominic Romanello
Created: 7/28/21
Modified: 8/3/21
Description: Controller class for CustomPurchasePage that allows the user to search for customer 
information and insert or update the customer information as needed. Also checks to see if the 
Ship_To_Billing_Address__c is checked and rerenders that section based on that. 
*/

public with sharing class CustomerPurchasePageController {

    public String input {get;set;}
    public Customer__c customer {get;set;}
    public Boolean shippingRender {get;set;}

    public CustomerPurchasePageController(){
        shippingRender = true;
        customer = new Customer__c();
        // checkboxUpdate();
    }

    // Method used to search for the Customer input in the field at the top of the page.
    public void search(){
        //if([SELECT * FROM Customer__c WHERE ((First_Name__c LIKE ('%'+input+'%')) OR (Last_Name__c LIKE ('%'+input+'%')))] == Null){        }
        customer = [SELECT Name, Id, First_Name__c, Last_Name__c, City__c, Credit_Card_Expiration_Month__c,
            Credit_Card_Expiration_Year__c, Credit_Card_Number__c, Credit_Card_Type__c, Email__c, Phone__c, Ship_to_Billing_Address__c,
            Shipping_City__c, Shipping_State__c, Shipping_Street__c, Shipping_Zip_Code__c, State__c, Street_Address__c,
            Zip__c
            FROM Customer__c WHERE Name = :input
            LIMIT 1];
        checkboxUpdate();
    }

    // Method used to insert or update the database with the page information
    public void save(){
        if(customer.Id == Null){
            insert customer;
        }else{
            update customer;
        }
    }

    //  Method used to see if the checkbox field Ship_to_Billing_Address is checked in order to 
	//	change the rendering of certain objects
    public void checkboxUpdate(){
        if(customer.Ship_to_Billing_Address__c == Null){
            shippingRender = true;
        }if(customer.Ship_to_Billing_Address__c == true){
           shippingRender = false;
        } else{
            shippingRender = true;
        }
    }
}