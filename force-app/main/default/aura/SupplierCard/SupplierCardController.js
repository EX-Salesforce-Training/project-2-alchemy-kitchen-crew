/*****************************************************************
* SupplierCardController.js
* Author: Evan DeVizio
* Created: 8/11/21
* Modified: 8/17/21
* Purpose: Client-side controller for the SupplierCard component.
******************************************************************/

({    
    supplierSaveAction2 : function(cmp, evt, hlpr) {
        cmp.find("supplierEditForm").submit();
        accSaveAction();
    },
    
    visitWebsiteAction : function(cmp, evt, hlpr) {
    	let supplierWebsite = cmp.get("v.supp.Website__c");
		window.open(supplierWebsite, '_blank');
    }
})