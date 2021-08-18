({
	createTransaction : function(component,customerId,storeId) {
		let createTransact = component.get("c.newTransaction");
        createTransact.setParams({
            "customerId" : customerId,
            "storeId" : storeId
        })
        createTransact.setCallback(this,function(response){
            if(response.getState() === "SUCCESS"){
                console.log("hi");
            }
        })
        $A.enqueueAction(createTransact);
	}
})