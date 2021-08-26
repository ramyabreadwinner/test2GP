@IsTest
private with sharing class SetupPageControllerTest {
    @IsTest
    private static void testMethodOne () {
        SetupPageController sc = new SetupPageController();
        sc.isSBInstalled = true;
        sc.isStripeBillingInstalled();
        sc.queryRecords();
    }
}