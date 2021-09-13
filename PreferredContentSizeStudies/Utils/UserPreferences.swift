import UIKit

public protocol UserPreferencesProtocol: AnyObject {
    var customContentSizeCategory: UIContentSizeCategory? { get set }
    var contentSizeScale: CGFloat { get }
}

public class UserPreferences: UserPreferencesProtocol {
    private init() { }
    
    public static var shared: UserPreferences = {
        return UserPreferences()
    }()
    
    public var customContentSizeCategory: UIContentSizeCategory?
}

public extension UserPreferencesProtocol {
    private var preferredContentSizeCategory: UIContentSizeCategory {
        return customContentSizeCategory ?? UIApplication.shared.preferredContentSizeCategory
    }
    
    var contentSizeScale: CGFloat {
        switch preferredContentSizeCategory {
        case .extraSmall:
            return 0.7
        case .small:
            return 0.8
        case .medium:
            return 0.9
        case .large:
            return 1
        case .extraLarge:
            return 1.22
        case .extraExtraLarge:
            return 1.44
        case .extraExtraExtraLarge:
            return 1.66
        default:
            return 1.66
        }
    }
}
