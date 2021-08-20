/**************************************************************
* SupplierComponentController.js
* Author: Evan DeVizio
* Created: 8/10/21
* Modified: 8/20/21
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
            window.setTimeout(
                $A.getCallback(function() {
                    hlpr.supplierHelper(cmp); 
                }), 500
            );           
        }
    },
    
    supplierObjsAction : function(component, event, helper) {
        let supplierObjs = component.get("c.getSupplierObjs");
        supplierObjs.setCallback(this, function(response) {
            if(response.getState() === "SUCCESS") {
                component.set("v.supplierObjs", response.getReturnValue());
            }
        })
        $A.enqueueAction(supplierObjs);
	},
    
    supplierOrderAction : function(cmp, evt, hlpr) {
        let supplierOrders = cmp.get("c.getSupplierOrders");
        supplierOrders.setCallback(this, function(response) {
            if(response.getState() === "SUCCESS") {
                cmp.set("v.suppOrders", response.getReturnValue());
            }
        })
        $A.enqueueAction(supplierOrders);
    },
    
    scrollAction : function(cmp, evt, hlpr) {
        let scrollOptions = {
            left: 0,
            top: 0,
            behavior: 'smooth'
        }
        window.scrollTo(scrollOptions);   
    }
})