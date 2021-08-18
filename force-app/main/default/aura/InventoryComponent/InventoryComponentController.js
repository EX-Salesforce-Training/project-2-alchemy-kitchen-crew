/***********************************************************
* InventoryComponentController.js
* Author: Evan DeVizio
* Created: 8/16/21
* Modified: 8/16/21
************************************************************/
({
	initStores : function(cmp, evt, hlpr) {
        let stores = cmp.get("c.getStores");
        stores.setCallback(this, function(response) {
            if(response.getState() === "SUCCESS") {
                cmp.set("v.Stores", response.getReturnValue());
            }
        })
        $A.enqueueAction(stores);
	},
    initProducts : function(cmp, evt, hlpr) {
        let products = cmp.get("c.getProducts");
        products.setCallback(this, function(response) {
            if(response.getState() === "SUCCESS") {
                cmp.set("v.Products", response.getReturnValue());
            }
        })
        $A.enqueueAction(products);
    }
    
})