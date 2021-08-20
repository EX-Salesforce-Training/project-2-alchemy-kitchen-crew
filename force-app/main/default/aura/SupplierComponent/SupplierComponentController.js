/**************************************************************
* SupplierComponentController.js
* Author: Evan DeVizio
* Created: 8/10/21
* Modified: 8/17/21
***************************************************************/
({
       newSupplier : function(cmp, evt, hlpr) {
        let newSuppView = cmp.get("v.newSuppSwitch"); 
        if (newSuppView == false) {
            cmp.set("v.newSuppSwitch", true);
        }
        else {
            cmp.set("v.newSuppSwitch", false);
        }
    },
      newSupplierSaveAction : function(cmp, evt, hlpr) {
        let suppName = cmp.find("NewSuppName").get("v.value");
        let suppEmail = cmp.find("NewSuppEmail").get("v.value");
        let suppPhone = cmp.find("NewSuppPhone").get("v.value");
        if(suppName === null || suppEmail === null || suppPhone === null) {
             throw new Error("\n" + "Please enter a value for all required fields." + "\n");
        	 console.log(suppName, suppEmail, suppPhone);
        }
        else {
            cmp.find("NewSupplierForm").submit();
            cmp.set("v.newSuppSwitch", false);
            hlpr.getSuppliers(cmp);
            
        }
          
    },
    
    supplierObjsAction : function(component, event, helper) {
        helper.getSuppliers(component);
	},
    
    supplierOrderAction : function(cmp, evt, hlpr) {
        let supplierOrders = cmp.get("c.getSupplierOrders");
        supplierOrders.setCallback(this, function(response) {
            if(response.getState() === "SUCCESS") {
                cmp.set("v.suppOrders", response.getReturnValue());
            }
        })
        $A.enqueueAction(supplierOrders);
    }
})