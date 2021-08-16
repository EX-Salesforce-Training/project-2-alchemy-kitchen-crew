({
	getProducts : function(component, event, helper) {
		let action = component.get("c.getAllProducts");
        action.setCallback(this, function(response) {
            if(response.getState()==="SUCCESS") {
                component.set("v.products", response.getReturnValue());
                console.log(response.getReturnValue());
            }
        })
        $A.enqueueAction(action);
	},
    
    updateCart : function(component,event,helper) {
    let productIds = event.getParam("productIds");
    component.set("v.cartItems",productIds);
	}
})