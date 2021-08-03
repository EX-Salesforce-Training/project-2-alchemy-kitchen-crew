public class TransactionData {
    public static void addTransaction() {
        
        Store__c s = [SELECT Id, Name From Store__c LIMIT 1];
        
        
        //Customer__c c = new Customer__c(First_Name__c='Customer1');
        //upsert c;
        //Creating a List for the zombie products.
        List<Product2> ZombieProdList = [SELECT Id, Name FROM Product2 WHERE ProductCode LIKE 'P%'];
        
        
        
        //Transaction__c trans = new Transaction__c();
        //trans.Date_Time__c = Datetime.now();
        //trans.Store__c = s.Id;

        //List<Product2> p2 = new List<Product2>();
        //p2.add(ZombieProdList[0].Id);
        //trans.product__c = ;
        
        //System.debug(trans);
        
        
        
        
        //for(Integer i=0; i<5; i++) {
            //Transaction__c t = new Transaction__c();
            //t.Date_Time__c = Datetime.now();
            //t.Sub_Total__c = ;
            //t.Quantity__c = 1 + i;
            //t.Store__c = s.Id;
            //t.Customer__c = c.Id;
            //t.Product__c = [];
            //trans.add(t);
        //}
        
        //upsert trans;
        //system.debug(trans);
        
        //List<Product2> prod = new List<Product2>();
        //List<Transaction__c> trs = new List<Transaction__c>();
        //trs.add(trans[0].Id);
        //trs.add(trans[1].Id);
        
        //for(Integer i=0; i<2; i++) {
            //product2 p = new Product2(Name='Product ' + i, Store__c=s.Id, Transaction__c = trs, Price__c=(50+i));
            //prod.add(p);
        //}
        //System.debug(Prod);
    
        //Insert prod;
    }
}