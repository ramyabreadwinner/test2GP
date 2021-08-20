@NamespaceAccessible
public with sharing class SetupPageController {
    public Boolean isSBInstalled                {get; set;}
    @NamespaceAccessible public String message                       {get; set;}
    @NamespaceAccessible public List<SObject> testList           {get; set;}
    public SetupPageController() {
        isSBInstalled = FALSE;
        testList = new List<SObject>();
        isStripeBillingInstalled();
    }
    @NamespaceAccessible
    public void queryRecords(){
        try{
            if(isSBInstalled){
                String queryString = 'SELECT Id, Name, Cust_Name__c, Country__c, Email__c FROM Customer__c';
                testList = database.query(queryString);
            }
            else {
                String queryString = 'SELECT Id, Name, Cust_Name__c, Country__c, Email__c FROM Customer__c';
                testList = database.query(queryString);
            }
        }
        catch(Exception e){
            message = 'Exception : ' + e.getMessage() +' Line Number : '+e.getLineNumber();
            System.debug('Exception : ' + e.getMessage() +' Line Number : '+e.getLineNumber());
        }
    }
    public void isStripeBillingInstalled(){
        try{
            message = 'Entered';
            HttpRequest req = new HttpRequest();
            req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionID());
            req.setHeader('Content-Type', 'application/json');
            String SFdomainUrl=URL.getSalesforceBaseUrl().toExternalForm();
            String query='Select+SubscriberPackage.NamespacePrefix,SubscriberPackage.Name+FROM+InstalledSubscriberPackage';
            String endpoint = SFdomainUrl+'/services/data/v49.0/tooling/query/?q='+query;
            System.debug('endpoint :::: '+endpoint);
            req.setEndpoint(endpoint);
            req.setMethod('GET');
            req.setTimeout(120000);
            Http h = new Http();
            HttpResponse res = new HttpResponse();
            if (!Test.isRunningTest()) {
                res = h.send(req);
                message = 'Request Sent';
                system.debug('Response ::: '+res.getBody());
            }
            if(res.getStatusCode() == 200 && res.getBody() != NULL){
                message = 'Request Sent and Success';
                Records rc = new Records();
                rc = (Records)JSON.deserialize(res.getBody(), Records.class);
                System.debug('rc ::: '+rc);                
                for(Record rec: rc.records){                
                    String packageName = rec.SubscriberPackage.Name;
                    if(packageName != NULL && packageName == 'testExtensionPkg'){
                        isSBInstalled = TRUE;
                    }
                }
                System.debug('isSBInstalled ::: '+isSBInstalled);
            }
        }catch(Exception e){
            message = 'Exception : ' + e.getMessage() +' Line Number : '+e.getLineNumber();
            System.debug('Exception : ' + e.getMessage() +' Line Number : '+e.getLineNumber());
        }
    }
    public class Records{
        public List<Record> records;
    }
    public class Record{
        public SubscriberPackage subscriberPackage;
    }
    public class SubscriberPackage{ 
        public String Name;
        public String NamespacePrefix;
    }
}
