({
    createReceipts : function(component,quantity,productId,customerId){
        let newReceipts = component.get("c.newReceipts");
        newReceipts.setParams({
            "quantity":quantity,
            "productId": productId,
            "customerId":customerId
        })
        newReceipts.setCallback(this,function(response){
            if(response.getState()==="SUCCESS") {
                console.log("new receipts",response.getReturnValue());
			}
        })
        $A.enqueueAction(newReceipts);
    }
})