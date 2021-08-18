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
    openConfirm : function(component,event,helper) {
        component.set("v.showConfirmDialog", true);
    },
    handleConfirmDialogNo : function(component,event,helper) {
        component.set("v.showConfirmDialog", false);
    },
    
    checkout : function(component,event,helper) {
        let cart = component.get("v.cart");
       	let customerId = component.get("v.customerId");
      	let storeId = component.get("v.storeId");
        let total = component.get("v.total");
        if(cart.length > 0){
          helper.createTransaction(component, customerId,storeId);
        }
      	
        let checkoutCart = $A.get("e.c:checkoutCart");
        checkoutCart.setParams({
            "customer" : customerId,
            "total" : total
            
        });
        checkoutCart.fire();
    }
})