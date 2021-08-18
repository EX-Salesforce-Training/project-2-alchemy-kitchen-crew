({
	myAction : function(component, event, helper) {
		
	},
    
    customerSaveAction : function(cmp, evt, hlpr) {
        cmp.find("customerSave").submit();
    },
    
    
    handleKeyUp: function (cmp,evt,customerId) {
        let isEnterKey = evt.keyCode === 13;
        if (isEnterKey) {
            console.log('just hit enter');
            let customerId = cmp.find('enter-search').get('v.value');
            
            let createCustomerId = cmp.get("c.newCustomerId");
            console.log('went to the cmpget');
            
            //alert('Searched for "' + queryTerm + '"!');
           createCustomerId.setParams({
                "customerId" : customerId
            }) 
            
            
            createCustomerId.setCallback(this, function(response){
                if(response.getState() === "SUCCESS") {
                    console.log("I guess it worked?");
                    cmp.set("v.recordId", response.getReturnValue());
                }
                else {
                    console.log('Did not work :(');
                    
                }
            })
            $A.enqueueAction(createCustomerId);
        }
    }
    

    
})