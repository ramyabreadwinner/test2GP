@IsTest(SeeAllData=false)
private with sharing class ChildDemoTest {
	@IsTest
	private static void TestCheckHowMad_Somewhat () {
		Integer controlMad = 1;

		Test.startTest();
		String resultMadDescription = ChildDemo.checkHowMad(controlMad);
		Test.stopTest();

		System.assertEquals('Somewhat', resultMadDescription);

	}

	@IsTest
	private static void TestCheckHowMad_Very () {
		Integer controlMad = 5;

		Test.startTest();
		String resultMadDescription = ChildDemo.checkHowMad(controlMad);
		Test.stopTest();

		System.assertEquals('Very', resultMadDescription);

	}

	@IsTest
	private static void TestCheckHowMad_Incredibly () {
		Integer controlMad = 5;

		Test.startTest();
		String resultMadDescription = ChildDemo.checkHowMad(controlMad);
		Test.stopTest();

		System.assertEquals('Very', resultMadDescription);

	}

	@IsTest
	private static void TestCheckHowMad_Not () {
		Integer controlMad = -5;

		Test.startTest();
		CuriousIndeed.minimumMad = -10;
		String resultMadDescription = ChildDemo.checkHowMad(controlMad);
		Test.stopTest();

		System.assertEquals('Not', resultMadDescription);

	}
}