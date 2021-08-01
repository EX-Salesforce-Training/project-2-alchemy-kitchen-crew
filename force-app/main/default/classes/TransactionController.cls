public class TransactionController {
    public Transaction__c trans {get;set;}
    public String myInput{get;set;}
  	public String myOutput{get;set;}
    public Decimal subTotal {get;set;}
    //public List<PriceBookEntry> prodPrice {get;set;}
    //public Map<String, Product2> tempMap {get;set;}
    
    public TransactionController() {}
    
    public void search() {
        //Grab and save input from VF page
        myOutput = myInput;
        
        //Query transaction based on above input
        trans = [SELECT Name, Store__r.Name, Date_Time__c, 
                 (SELECT Product__r.ProductCode, Product__r.Name, Product__r.Price__c From Receipts__r) 
                 FROM Transaction__c WHERE Name = :myOutput];
        
        //Variable to calculate sub-total
        Decimal subTotal = 0;
        
        //Grab list of receipts from above query
        List<Receipt__c> queryReceipt = trans.Receipts__r;
        
        //Loop through above list of receipts 
        for(Receipt__c r : queryReceipt) {
            //Add each products price from receipts to sub-total
            subTotal += r.Product__r.Price__c;
        }
        
        //Calculate tax ansd total from sub-total
        Decimal tax = subTotal * 0.075;
        Decimal total = subTotal + tax;
        
        trans.Sub_Total__c = subTotal;
        trans.Tax__c = tax;
        trans.Total__c = total;
        
        //price = trans.Receipts__r;
        //Product2 prodRef = new Product2();
        
      	//List<Product2> unitPrice = new List<Product2>();
        //for(Receipt__c r : price) {
            //prodRef.Id = r.Product__c;
            //unitPrice.add(prodRef);
        //}
       
        //tempMap = new Map<String, Product2>(price);
        
        //prodPrice = [SELECT UnitPrice FROM PriceBookEntry WHERE Product2Id IN :unitPrice];
	}
    
    //Query list price from PriceBookEntry
    //SELECT Product2.Name, PriceBook2.Name, UnitPrice FROM PricebookEntry
    //
}