/***************************************************************
* SupplierComponentHelper.js
* Author: Evan DeVizio
* Created: 8/20/21
* Modified: 8/20/21
* Purpose: Helper class with a method for refreshing the supplier
		   Aura accordion component in the view
****************************************************************/
({
	supplierHelper : function(component)  {
        let supplierObjs = component.get("c.getSupplierObjs");
        supplierObjs.setCallback(this, function(response) {
            if(response.getState() === "SUCCESS") {
                component.set("v.supplierObjs", response.getReturnValue());
            	console.log(response.getReturnValue());
            }
        })
        $A.enqueueAction(supplierObjs);
	}
})