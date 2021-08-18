({
	retrieveProduct : function(component, event, helper) {
        let id = component.get("v.id");
		let action = component.get("c.getProduct");
        action.setParams({
            "Id": id
        })
        action.setCallback(this, function(response) {
            if(response.getState() === "SUCCESS") {
                let product = response.getReturnValue();
                component.set("v.price",product.Price__c);
                console.log("price has been set");
            } else {
                console.log("failed" ,response.getState());
            }
        })
        $A.enqueueAction(action);
	},
    
    
    
    addToCart : function(component,event, helper) {
    	let addToCartEvent = component.getEvent("addToCartEvent");
        let UpdateQuantity = $A.get("e.c:UpdateQuantity");
        let cart = component.get("v.cart")
        let productId = component.get("v.id");
        let productPrice = component.get("v.price");
        console.log("price in productitemcontroller",productPrice);
        
        if(!cart.includes(productId)){
        cart.push(productId);
        }
        
		
        addToCartEvent.setParams({
            "productIds" : cart
        })
        
        
        UpdateQuantity.setParams({
            "productToUpdate": productId,
            "productPrice" : productPrice
        })
        
        addToCartEvent.fire();
        UpdateQuantity.fire();
	}
})