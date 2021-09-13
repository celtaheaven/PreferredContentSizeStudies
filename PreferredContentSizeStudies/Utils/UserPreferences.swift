import UIKit

public protocol UserPreferencesProtocol: AnyObject {
    #if TESTING
    var preferredContentSizeCategory: UIContentSizeCategory { get set }
    #else
    var preferredContentSizeCategory: UIContentSizeCategory { get }
    #endif
    var contentSizeScale: CGFloat { get }
}

public class UserPreferences: UserPreferencesProtocol {
    private init() { }
    
    public static var shared: UserPreferences = {
        return UserPreferences()
    }()
    
    #if TESTING
    private var _preferredContentSizeCategory: UIContentSizeCategory?
    public var preferredContentSizeCategory: UIContentSizeCategory {
        set {
            _preferredContentSizeCategory = newValue
        }
        get {
            return _preferredContentSizeCategory ?? UIApplication.shared.preferredContentSizeCategory
        }
    }
    #else
    public var preferredContentSizeCategory: UIContentSizeCategory {
        return UIApplication.shared.preferredContentSizeCategory
    }
    #endif
}

public extension UserPreferencesProtocol {
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
