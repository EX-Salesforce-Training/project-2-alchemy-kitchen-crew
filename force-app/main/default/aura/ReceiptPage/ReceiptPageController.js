({
    retreiveInfo : function(component,event,helper) {
        console.log("did i initialize?");
        let customerId = component.get("v.customer");
        console.log("customerId", customerId);
        let getReceiptsAction = component.get("c.getReceipts");
        getReceiptsAction.setParams({
            "customerId" : customerId
        });
        getReceiptsAction.setCallback(this, function(response) {
            if(response.getState() === "SUCCESS") {
              component.set("v.productIds",response.getReturnValue());
                console.log('receipts',response.getReturnValue());
            } else {
                console.log("state",response.getState());
            }
        })
        window.setTimeout(
            $A.getCallback(function() {
               $A.enqueueAction(getReceiptsAction);
            }), 5000
    	);
        helper.retreiveCustomerInfo(component);
    },
    
    displaySurvey : function(component,event,helper) {
     console.log("clicked the button");
	component.set("v.displaySurvey",true);
    },
    
    displayProducts : function(component,event,helper) {
        let action = component.getEvent("displayProductsPage");
        action.fire();
    }
    
})