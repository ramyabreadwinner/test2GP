@NamespaceAccessible
public with sharing class SetupPageController {
    @NamespaceAccessible
    public Boolean isSBInstalled                {get; set;}
    @NamespaceAccessible
    public SetupPageController() {
        isSBInstalled = FALSE;
        isStripeBillingInstalled();
    }
    @NamespaceAccessible
    public void isStripeBillingInstalled(){
        try{
            HttpRequest req = new HttpRequest();
            req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionID());
            req.setHeader('Content-Type', 'application/json');
            String SFdomainUrl=URL.getSalesforceBaseUrl().toExternalForm();
            String query='Select+SubscriberPackage.NamespacePrefix,SubscriberPackage.Name+FROM+InstalledSubscriberPackage';
            req.setEndpoint(SFdomainUrl+'/services/data/v49.0/tooling/query/?q='+query);
            req.setMethod('GET');
            req.setTimeout(120000);
            Http h = new Http();
            HttpResponse res = new HttpResponse();
            if (!Test.isRunningTest()) {
                res = h.send(req);
                system.debug('Response ::: '+res.getBody());
            }
            if(res.getStatusCode() == 200 && res.getBody() != NULL){
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
