({
    retrieveReceipt : function(component, event, helper) {
          let productId = component.get("v.product");
        let action = component.get("c.getProduct");
        console.log("got in retreive Receipt");
        console.log(productId);
        action.setParams({
            "productId" : productId
        });
        action.setCallback(this, function(response) {
            if(response.getState()==="SUCCESS") {
                let product = response.getReturnValue();
                component.set("v.productName",product.Name);
                component.set("v.productPrice",product.Price__c);
                component.set("v.loaded",true);
            } else {
                console.log("state",response.getState());
            }
        })
        $A.enqueueAction(action);
	}
})