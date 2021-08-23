({
	login : function(component, event, helper) {
        let signInEvent = $A.get("e.c:SignIn");
		let email = component.get("v.email");
        let password = component.get("v.password")
        let action = component.get("c.checkEmailPassword");
        action.setParams({
            "email" : email,
            "password" : password
        });
        action.setCallback(this, function(response) {
            if(response.getState()== "SUCCESS") {
                let user = response.getReturnValue();
                if(user && user.Credit_Card_Type__c) {
                    signInEvent.setParams({
                        "userId" : user.Id,
                        "userName" : user.First_Name__c,
                        "isCustomer" : true
                    })
                    signInEvent.fire();
                } else if(user) {
                    signInEvent.setParams({
                        "userId" : user.Id,
                        "userName" : user.First_Name__c
					})
                    signInEvent.fire();
                } else {
                    alert("Username or Password was Incorrect");
                }
            } else {
                console.log("state", response.getState());
            }
        })
        $A.enqueueAction(action);
	}
})