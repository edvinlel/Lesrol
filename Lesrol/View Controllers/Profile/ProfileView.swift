//
//  ProfileView.swift
//  Lesrol
//
//  Created by Edvin Lellhame on 9/9/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit

class ProfileView: UIView {
    
    let logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("log out", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .black
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.TripsColor.background
        
        setSubviewForAutoLayout(logoutButton)
        
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            logoutButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            logoutButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0)
        ])
    }
}
