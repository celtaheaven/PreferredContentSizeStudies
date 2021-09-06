import UIKit

extension UIView {
    func addSubview(_ view: UIView, _ constraints: [NSLayoutConstraint]) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        applyConstraints(constraints)
    }
    
    func applyConstraints(_ constraints: [NSLayoutConstraint]) {
        constraints.forEach { $0.isActive = true }
    }
    
    func updateConstraint(_ constraint: inout NSLayoutConstraint?, updatedConstraint: ()->(NSLayoutConstraint)) {
        if let constraint = constraint {
            constraint.isActive = false
            removeConstraint(constraint)
        }
        
        constraint = updatedConstraint()
        constraint?.isActive = true
    }
}
