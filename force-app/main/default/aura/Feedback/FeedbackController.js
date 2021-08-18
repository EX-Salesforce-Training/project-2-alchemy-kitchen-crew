/**************************************************************
* SupplierComponentController.js
* Author: Evan DeVizio
* Created: 8/16/21
* Modified: 8/16/21
***************************************************************/
({
    saveFeedback : function(component, event, helper) {
        component.find("FeedbackForm").submit();
        component.set("v.modalSwitch", true);
    },
 
    closeModel: function(component, event, helper) {
    	component.set("v.modalSwitch", false);
   	},
})