({
	signIn : function(component, event, helper) {
        component.set("v.userId",event.getParam("userId"));
        component.set("v.userName",event.getParam("userName"));
		component.set("v.signedIn",true);
        component.set("v.customer",event.getParam("isCustomer"));
        console.log(component.get("v.userName"));
	},
    logout : function(component,event,helper) {
      component.set("v.signedIn",false);
    }
})