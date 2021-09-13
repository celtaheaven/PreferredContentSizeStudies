import XCTest
import FBSnapshotTestCase

@testable
import PreferredContentSizeStudies

open class ScalableSnapshotsTestCase: FBSnapshotTestCase {
    var standardContentSizeCategories: [UIContentSizeCategory] {
        [.extraSmall, .small, .medium, .large, .extraLarge, .extraExtraLarge, .extraExtraExtraLarge]
    }
    
    func forEachStandardContentSizesCategories(_ closure: (UIContentSizeCategory)->()) {
        for contentSizeCategory in standardContentSizeCategories {
            UserPreferences.shared.preferredContentSizeCategory = contentSizeCategory
            closure(contentSizeCategory)
        }
    }
    
    func snapshot(_ viewController: UIViewController, identifier: String? = nil) {
        FBSnapshotVerifyViewController(viewController, identifier: identifier)
    }
    
    @discardableResult
    func setUpWindow(with viewController: UIViewController, andFrame frame: CGRect = UIScreen.main.bounds) -> UIWindow {
        let window = UIWindow(frame: frame)
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        return window
    }
    
    open override func tearDown() {
        super.tearDown()
        UserPreferences.shared.preferredContentSizeCategory = UIApplication.shared.preferredContentSizeCategory
    }
}