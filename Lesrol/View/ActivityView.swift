//
//  ActivityView.swift
//  Trips
//
//  Created by Edvin Lellhame on 7/26/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit

class ActivityView: UIView {

    // MARK: Views
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.set(cornerRadius: 15)
        view.isHidden = true
        return view
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(style: .large)
        activity.color = .white
        return activity
    }()
    

    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setSubviewForAutoLayout(backgroundView)
        backgroundView.setSubviewForAutoLayout(activityIndicator)
        
        /// Background View
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            backgroundView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
        
        /// Activity Indicator
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor)
        ])
    }
    
    // MARK: Helper Methods
    
    /// ActivityIndicator is hidden from the initialization.
    /// True: If you want to show and start the spinner.
    /// False: if you want to hide and stop the spinner.
    func startActivitySpinner(flag: Bool) {
        if flag {
            backgroundView.isHidden = false
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
        } else {
            backgroundView.isHidden = true
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
        }
    }

}
