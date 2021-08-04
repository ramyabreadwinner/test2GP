public class testDemo{
    public List<ramyaTest01__Test_Obj__c> testList    {get; set;}
    public testDemo(){
        testList = [SELECT Id, Name, ramyaTest01__Text_1__c, ramyaTest01__Text_2__c FROM ramyaTest01__Test_Obj__c];
        System.debug('testList :::: '+testList);
    }
}