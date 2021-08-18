({
	myAction : function(component, event, helper) {
		
	},

    punchClick : function (cmp, event, helper) {
       // alert("You clicked: " + event.getSource().get("v.label"));
       console.log('just clicked punch');
       let zombieHealthHit = cmp.get('v.zombieHealth');
        console.log('got zombieHealth');
        let punchDamage = cmp.get('v.punchAttack')
        let afterZombieHit = cmp.get("c.Attacking");
        console.log('pointed to Attacking apex controller');
        
        afterZombieHit.setParams({
                "zombieHealthHit" : zombieHealthHit,
            	"damage" : punchDamage,
            })
           //     if(cmp.get("v.zombieHealth") == 0) {
           // cmp.set("v.outOfHealth", True);
        
        
        afterZombieHit.setCallback(this, function(response){
                if(response.getState() === "SUCCESS") {
                    console.log("I guess it worked?");
                    cmp.set("v.zombieHealth", response.getReturnValue());
                    
                }
                else {
                    console.log('Did not work :(');
                    
                }
            })
        
        $A.enqueueAction(afterZombieHit);

    },
    
    
    knifeClick : function (cmp, event, helper) {
       // alert("You clicked: " + event.getSource().get("v.label"));
       console.log('just clicked knife');
       let zombieHealthHit = cmp.get('v.zombieHealth');
        console.log('got zombieHealth');
        let knifeDamage = cmp.get('v.knifeAttack')
        let afterZombieHit = cmp.get("c.Attacking");
        console.log('pointed to Attacking apex controller');
        
        afterZombieHit.setParams({
                "zombieHealthHit" : zombieHealthHit,
            	"damage" : knifeDamage,
            })
        afterZombieHit.setCallback(this, function(response){
                if(response.getState() === "SUCCESS") {
                    console.log("I guess it worked?");
                    cmp.set("v.zombieHealth", response.getReturnValue());
                }
                else {
                    console.log('Did not work :(');
                    
                }
            })
        $A.enqueueAction(afterZombieHit);
    },
    
    
    batClick : function (cmp, event, helper) {
        // alert("You clicked: " + event.getSource().get("v.label"));
       console.log('just clicked bat');
       let zombieHealthHit = cmp.get('v.zombieHealth');
        console.log('got zombieHealth');
        let batDamage = cmp.get('v.batAttack')
        let afterZombieHit = cmp.get("c.Attacking");
        console.log('pointed to Attacking apex controller');
        
        afterZombieHit.setParams({
                "zombieHealthHit" : zombieHealthHit,
            	"damage" : batDamage,
            })
        afterZombieHit.setCallback(this, function(response){
                if(response.getState() === "SUCCESS") {
                    console.log("I guess it worked?");
                    cmp.set("v.zombieHealth", response.getReturnValue());
                }
                else {
                    console.log('Did not work :(');
                    
                }
            })
        $A.enqueueAction(afterZombieHit);
    },
    
    
    
    katanaClick : function (cmp, event, helper) {
        // alert("You clicked: " + event.getSource().get("v.label"));
       console.log('just clicked katana');
       let zombieHealthHit = cmp.get('v.zombieHealth');
        console.log('got zombieHealth');
        let katanaDamage = cmp.get('v.katanaAttack')
        let afterZombieHit = cmp.get("c.Attacking");
        console.log('pointed to Attacking apex controller');
        
        afterZombieHit.setParams({
                "zombieHealthHit" : zombieHealthHit,
            	"damage" : katanaDamage,
            })
        afterZombieHit.setCallback(this, function(response){
                if(response.getState() === "SUCCESS") {
                    console.log("I guess it worked?");
                    cmp.set("v.zombieHealth", response.getReturnValue());
                }
                else {
                    console.log('Did not work :(');
                    
                }
            })
        $A.enqueueAction(afterZombieHit);
        
    }
})