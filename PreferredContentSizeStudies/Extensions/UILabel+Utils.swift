import UIKit

extension UILabel {
    func preferredContentSizeCategoryFont(with textStyle: UIFont.TextStyle) {
        if let customContentSizeCategory = UserPreferences.shared.customContentSizeCategory {
            let traitCollection = UITraitCollection(preferredContentSizeCategory: customContentSizeCategory)
            self.font = UIFont.preferredFont(forTextStyle: textStyle, compatibleWith: traitCollection)
            adjustsFontForContentSizeCategory = false
        } else {
            self.font = UIFont.preferredFont(forTextStyle: textStyle)
            adjustsFontForContentSizeCategory = true
        }
    }
}
