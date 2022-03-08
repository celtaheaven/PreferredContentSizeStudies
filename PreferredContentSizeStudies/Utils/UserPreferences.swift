import UIKit

public protocol UserPreferencesProtocol: AnyObject {
    #if TESTING
    var contentSizeCategory: UIContentSizeCategory { get set }
    #else
    var contentSizeCategory: UIContentSizeCategory { get }
    #endif
    var contentSizeScale: CGFloat { get }
    var traitCollection: UITraitCollection { get }
}

public class UserPreferences: UserPreferencesProtocol {
    private init() { }
    
    private let memoizedTraitCollection = memoize(UITraitCollection.init(preferredContentSizeCategory:))

    public static var shared: UserPreferences = {
        return UserPreferences()
    }()
    
    #if TESTING
    private var _contentSizeCategory: UIContentSizeCategory = UIApplication.shared.preferredContentSizeCategory
    public var contentSizeCategory: UIContentSizeCategory {
        get { return _contentSizeCategory }
        set { _contentSizeCategory = newValue }
    }
    #else
    public var contentSizeCategory: UIContentSizeCategory {
        UIApplication.shared.preferredContentSizeCategory
    }
    #endif

    public var traitCollection: UITraitCollection {
        return memoizedTraitCollection(contentSizeCategory)
    }
}

public extension UserPreferencesProtocol {
    var contentSizeScale: CGFloat {
        switch contentSizeCategory {
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
