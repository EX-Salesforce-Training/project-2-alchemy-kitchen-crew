/**************************************************************
* SupplierComponentController.js
* Author: Evan DeVizio
* Created: 8/10/21
* Modified: 8/17/21
***************************************************************/
({
    supplierSaveAction : function(cmp, evt, hlpr) {
        action.setParams({ "name" : cmp.get("v.supp.Name"),
                          "phone" : cmp.get("v.supp.Phone")
                         });
        
        action.setCallback(this, function(response) {
            let state = response.getState()
            });
        
        if (state === "SUCCESS") {
            console.log(cmp.get("c.saveAcc"));    
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
    }
})