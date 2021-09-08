import UIKit

extension UILabel {
    func preferredContentSizeCategoryFont(with textStyle: UIFont.TextStyle) {
        #if TESTING
        let traitCollection = UITraitCollection(preferredContentSizeCategory: UserPreferences.shared.preferredContentSizeCategory)
        self.font = UIFont.preferredFont(forTextStyle: textStyle, compatibleWith: traitCollection)
        adjustsFontForContentSizeCategory = false
        #else
        self.font = UIFont.preferredFont(forTextStyle: textStyle)
        adjustsFontForContentSizeCategory = true
        #endif
    }
}
