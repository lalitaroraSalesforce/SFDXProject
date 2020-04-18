public with sharing  class CampingListController {
    
    @AuraEnabled
    public static List<Camping_Item__c> getItems()
    {
        return [select id from Camping_Item__c];
        
    }
    
    @AuraEnabled
    public static Camping_Item__c saveItem(Camping_Item__c campingItem)
    {
        insert CampingItem;
        return CampingItem;
    }

}