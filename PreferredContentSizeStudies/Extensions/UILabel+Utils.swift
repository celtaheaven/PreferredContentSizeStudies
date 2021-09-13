import UIKit

extension UILabel {
    func preferredContentSizeCategoryFont(with textStyle: UIFont.TextStyle) {
        let traitCollection = UITraitCollection(preferredContentSizeCategory: UserPreferences.shared.preferredContentSizeCategory)
        self.font = UIFont.preferredFont(forTextStyle: textStyle, compatibleWith: traitCollection)
        adjustsFontForContentSizeCategory = false
    }
}
