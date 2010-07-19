package org.syncon.popups.test.suites
{
	import org.syncon.popups.test.cases.TestFlickrService;
	import org.syncon.popups.test.cases.TestGalleryLabelMediation;
	import org.syncon.popups.test.cases.TestGalleryModel;
	import org.syncon.popups.test.cases.TestGalleryViewMediation;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class RobotlegsImageGalleryTestSuite
	{
		public var testFlickrService:TestFlickrService;
		public var testGalleryModel:TestGalleryModel;
		public var testGalleryLabel:TestGalleryLabelMediation;
		public var testGalleryViewMediation:TestGalleryViewMediation;
	}
}