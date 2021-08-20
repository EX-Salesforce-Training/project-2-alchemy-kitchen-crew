({
	getSuppliers : function(component) {
		 let supplierObjs = component.get("c.getSupplierObjs");
        supplierObjs.setCallback(this, function(response) {
            if(response.getState() === "SUCCESS") {
                component.set("v.supplierObjs", response.getReturnValue());
                console.log("suppliers",response.getReturnValue());
            }
        })
        $A.enqueueAction(supplierObjs);
	}
})