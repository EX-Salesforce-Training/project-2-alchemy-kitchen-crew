public class TBODController {

    @AuraEnabled
    public static Integer Attacking(Integer zombieHealthHit, Integer damage){
        
        Integer zombieHealthLeft = zombieHealthHit - damage;
        if(zombieHealthLeft <= 0) {
            zombieHealthLeft=0;
            
        }
        
        return zombieHealthLeft;
        
        
        
        
        
    }
    
}