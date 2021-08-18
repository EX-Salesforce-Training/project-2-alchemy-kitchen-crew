@isTest
public class TryBuyOrDieTest {

    
    @isTest
    static void TBODTest() {
        Integer zombieHealthHit=95;
        Integer damage=15;
        
        
        //Start the Test
        
        Integer zombieHealthLeft = TBODController.Attacking(zombieHealthHit,damage);
        
		System.assertEquals(zombieHealthLeft, 80);
        
        
        
        zombieHealthHit=67;
        damage=22;
        
        
        	zombieHealthLeft = zombieHealthHit - damage;
        
        System.assertNotEquals(zombieHealthLeft, null, 'Value should not be null');
        
        
        
        
    }
    
    
    
}