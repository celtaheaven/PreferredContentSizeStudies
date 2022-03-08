import UIKit

public protocol UserPreferencesProtocol: AnyObject {
    #if TESTING
    var customContentSizeCategory: UIContentSizeCategory { get set }
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
    public var customContentSizeCategory: UIContentSizeCategory = UIApplication.shared.preferredContentSizeCategory
    public var traitCollection: UITraitCollection {
        return memoizedTraitCollection(customContentSizeCategory)
    }
    #else
    public var traitCollection: UITraitCollection {
        return memoizedTraitCollection(UIApplication.shared.preferredContentSizeCategory)
    }
    #endif
}

public extension UserPreferencesProtocol {
    var contentSizeScale: CGFloat {
        #if TESTING
        let preferredContentSizeCategory = customContentSizeCategory
        #else
        let preferredContentSizeCategory = UIApplication.shared.preferredContentSizeCategory
        #endif
        
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
