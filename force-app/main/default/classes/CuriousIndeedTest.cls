@IsTest
private without sharing class CuriousIndeedTest {
    @IsTest
    private static void testNotMad () {
        Test.startTest();
        Integer resultingLevelOfMad = CuriousIndeed.getMadOrMadder(0);
        Test.stopTest();

        System.assertEquals(CuriousIndeed.minimumMad, resultingLevelOfMad, 'Should be at least minimum mad.');
    }

    @IsTest
    private static void testIsMad () {
        Test.startTest();
        Integer resultingLevelOfMad = CuriousIndeed.getMadOrMadder(1);
        Test.stopTest();

        System.assertEquals(CuriousIndeed.minimumMad + 1, resultingLevelOfMad, 'Should be more mad now.');
    }

    @IsTest
    private static void testCustomMad () {
        CuriousIndeed.minimumMad = 5;

        Test.startTest();
        Integer resultingLevelOfMad = CuriousIndeed.getMadOrMadder(1);
        Test.stopTest();

        System.assertEquals(CuriousIndeed.minimumMad, resultingLevelOfMad, 'Should be at custom minimum mad.');
    }
}