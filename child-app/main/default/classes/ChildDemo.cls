public with sharing class ChildDemo {
	public static String checkHowMad (Integer baseMad) {
		Integer howMad = CuriousIndeed.getMadOrMadder(baseMad);

		if (howMad <= 0) {
			return 'Not';
		} else if (howMad < 5) {
			return 'Somewhat';
		} else if (howMad < 11) {
			return 'Very';
		} else {
			return 'Incredibly';
		}
	}
}