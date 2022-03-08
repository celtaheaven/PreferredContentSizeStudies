import XCTest

@testable import PreferredContentSizeStudies

class ViewControllerTests: ScalableSnapshotsTestCase {
    override func setUp() {
        super.setUp()
        
//        Snapshot tests are based of iPhone 11 Simulator
//        recordMode = true
    }
    
    func testSnapshotForStandardCategory() {
        forEachStandardContentSizesCategories { category in
            let viewController = ViewController()
            self.setUpWindow(with: viewController)
            
            snapshot(viewController, identifier: "view_controller_\(category.rawValue)")
        }
    }
}
