({
	updateTotal : function(component, event, helper) {
		let price = event.getParam("productPrice");
        let total = component.get("v.total");
        total += price;
        component.set("v.total",total);
	},
    
    updateCart : function(component,event, helper) {
        let addPrice = event.getParam("addPrice");
        let removePrice = event.getParam("removePrice");
        let total = component.get("v.total");
        if(addPrice) {
            total += addPrice;
        } else if(removePrice){
            total -= removePrice
        }
        component.set("v.total",total);
        
        let productId = event.getParam("productId");
        if(productId) {
            let cart = component.get("v.cart");
            let index = cart.indexOf(productId);
            cart.splice(index,1);
            component.set("v.cart",cart);
        }
    },
    
    checkout : function(component,event,helper) {
        console.log('checkout fired');
        let checkoutCart = $A.get("e.c:checkoutCart");
        checkoutCart.fire();
    }
})