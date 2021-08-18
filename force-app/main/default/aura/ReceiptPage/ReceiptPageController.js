({
    retreiveInfo : function(component,event,helper) {
        let customerId = component.get("v.customer");
        console.log("customerId", customerId);
        let getReceiptsAction = component.get("c.getReceipts");
        getReceiptsAction.setParams({
            "customerId" : customerId
        });
        getReceiptsAction.setCallback(this, function(response) {
            if(response.getState() === "SUCCESS") {
              component.set("v.productIds",response.getReturnValue());
            } else {
                console.log("state",response.getState());
            }
        })
        window.setTimeout(
            $A.getCallback(function() {
               $A.enqueueAction(getReceiptsAction);
            }), 3000
    	);
        helper.retreiveCustomerInfo(component);
    }
})