//
//  ConstraintAnimation.swift
//  Lesrol
//
//  Created by Edvin Lellhame on 8/3/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit

struct ConstraintAnimation {
    
    // MARK: Properties
    static var addContainerCachedConstraints = [NSLayoutConstraint]()
    
    /// Sets up constraints on view to be animated. Used to animate a custom container view up or down by height.
    ///
    /// - Parameters:
    ///   - constraints: The cached constraints stored for that view.
    ///   - customView: The view to be animated.
    ///   - mainView: The view on which the custom view is constrained to.
    ///   - height: Size of the heightAnchor for the custom view.
    ///   - duration: The duration for the view animation.
    /// - Returns: An array of NSLayoutConstraint of previously cached constraints.
    static func animateView(with constraints: [NSLayoutConstraint], for customView: UIView, in mainView: UIView, withHeight height: CGFloat, forDuration duration: TimeInterval) -> [NSLayoutConstraint] {
        
        let leftAnchor = customView.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 0)
        let rightAnchor = customView.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: 0)
        let bottomAnchor = customView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 0)
        let heightAnchor = customView.heightAnchor.constraint(equalToConstant: height)
        
        
        let constraintsArray = [leftAnchor, rightAnchor, bottomAnchor, heightAnchor]
        
        UIView.animate(withDuration: duration) {
            
            NSLayoutConstraint.deactivate(constraints)
            
            customView.translatesAutoresizingMaskIntoConstraints = false
            
            
            NSLayoutConstraint.activate(constraintsArray)
            mainView.layoutIfNeeded()
            
            
        }
        
        return constraintsArray
    }
}
