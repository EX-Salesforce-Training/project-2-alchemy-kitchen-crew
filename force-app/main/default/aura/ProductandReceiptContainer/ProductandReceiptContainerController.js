({
	displayReceipt : function(component, event, helper) {
       let customer = event.getParam("customer");
       let total = event.getParam("total");
        component.set("v.customer",customer);
        component.set("v.total",total);
		component.set("v.showReceipt", true);
	},
    displayProducts : function(component,event,helper) {
        component.set("v.showReceipt",false);
    }
})