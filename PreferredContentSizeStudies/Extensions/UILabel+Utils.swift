import UIKit

extension UILabel {
    func preferredContentSizeCategoryFont(with textStyle: UIFont.TextStyle) {
        self.font = UIFont.preferredFont(forTextStyle: textStyle, compatibleWith: UserPreferences.shared.traitCollection)
        adjustsFontForContentSizeCategory = false
    }
}
