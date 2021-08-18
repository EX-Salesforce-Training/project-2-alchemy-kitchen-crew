({
	updateQuantity : function(component, event, helper) {
        let updatingId = event.getParam("productToUpdate");
        let currentId = component.get("v.item");
       	let quantity = component.get("v.quantity");
        if(updatingId == currentId) {
            quantity +=1;
            component.set("v.quantity", quantity);
        }
	},
    
    getItem : function(component,event,helper) {
    	let action = component.get("c.getProduct");
       	let id = component.get("v.item");
        action.setParams({
            "Id": id
        });
        action.setCallback(this,function(response) {
            if(response.getState() === "SUCCESS") {
               component.set("v.product", response.getReturnValue());
            } else {
                console.log("state = ", response.getState());
            }
        })
        $A.enqueueAction(action);
	},
    
    addToQuantity : function(component,event,helper) {
        let quantity = component.get("v.quantity");
        quantity += 1;
        component.set("v.quantity",quantity);
        
        let price = component.get("v.product").Price__c;
        console.log(price);
        let action = component.getEvent("AddRemoveQuantity");
        action.setParams({
            "addPrice" : price
        });
        action.fire();
    },
    
    removeQuantity : function(component,event,helper) {
        let quantity = component.get("v.quantity");
        quantity -= 1;
        component.set("v.quantity", quantity);
        
        let price = component.get("v.product").Price__c;
        let productId = component.get("v.item");
        let action = component.getEvent("AddRemoveQuantity");
        if(quantity <= 0) {
             action.setParams({
            "removePrice": price,
            "productId": productId
        	})
        } else {
           action.setParams({
            "removePrice": price
        	})  
        }
       action.fire();
    },
    
    checkout : function(component,event,helper) {

      let customerId = component.get("v.customerId"); 
      let quantity = component.get("v.quantity");
      let productId = component.get("v.item");
        
      helper.createReceipts(component,quantity,productId,customerId)
      
    }
    
    
    
    
    
    
    
    
    
    
    
    
})