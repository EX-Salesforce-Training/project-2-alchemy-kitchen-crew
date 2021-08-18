({
	displayReceipt : function(component, event, helper) {
       let customer = event.getParam("customer");
       let total = event.getParam("total");
        component.set("v.customer",customer);
        component.set("v.total",total);
		component.set("v.showReceipt", true);
<<<<<<< HEAD
	}
=======
	},
    displayProducts : function(component,event,helper) {
        component.set("v.showReceipt",false);
    }
>>>>>>> 67bae5c27ad2bab31f5dfe90111cac1c84e49cf3
})