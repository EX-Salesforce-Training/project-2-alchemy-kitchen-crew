({
    retreiveCustomerInfo : function(component) {
        let customerId = component.get("v.customer");
        let action = component.get("c.getCustomer");
        action.setParams({
            "customerId": customerId
        });
        action.setCallback(this, function(response) {
            if (response.getState() === "SUCCESS") {
                let customer = response.getReturnValue();
                component.set("v.customerName",customer.First_Name__c);
                component.set("v.creditCard",customer.Credit_Card_Type__c);
                component.set("v.street",customer.Street_Address__c);
                component.set("v.city",customer.City__c);
                component.set("v.state",customer.State__c);
                component.set("v.zip", customer.Zip__c);
                component.set("v.loaded",true);
            }
        })
        $A.enqueueAction(action);
    }
})