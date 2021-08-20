({
checkHealth : function (cmp) {
       
       console.log('checking health...');
       let zombieCurrentHealth = cmp.get('v.zombieHealth');
        console.log('got zombieHealth');
            
            if (zombieCurrentHealth > 70) {
              cmp.set("v.fullHealth", true);
              cmp.set("v.midHealth", false);
              cmp.set("v.lowHealth", false);

               
            } else {
              if (zombieCurrentHealth > 30) {
              cmp.set("v.fullHealth", false);
              cmp.set("v.midHealth", true);
              cmp.set("v.lowHealth", false);

            } else {
              if (zombieCurrentHealth > 0) {
              cmp.set("v.fullHealth", false);
              cmp.set("v.midHealth", false);
              cmp.set("v.lowHealth", true);

            } else {
                
              cmp.set("v.fullHealth", false);
              cmp.set("v.midHealth", false);
              cmp.set("v.lowHealth", false);
                    
                
            }
            }
            }
            
            
            
            

      

    },
})