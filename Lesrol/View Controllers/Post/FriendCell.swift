//
//  FriendCell.swift
//  Trips
//
//  Created by Edvin Lellhame on 8/1/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit

class FriendCell: UICollectionViewCell {
    
    // MARK: Properties
    
    static let reuseIdentifer = "FriendCell"
    
    
    // MARK: Views
    
    let profileImageView: ProfileImageView = {
        let view = ProfileImageView()
        return view
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Jordan Lellhame"
        label.font = UIFont.gilroyMedium(ofSize: 12)
        label.textColor = UIColor.TripsColor.paragraphGray
        label.minimumScaleFactor = 0.1
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    
    // MARK: Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setSubviewsForAutoLayout([profileImageView, usernameLabel])
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Helper Methods
    
    func setCell() {
        profileImageView.setImageView(image: UIImage(named: "jordan"))
        
    }
    
    
    // MARK: Constraints
    
    private func setConstraints() {
        /// ImageView
        NSLayoutConstraint.activate([
            profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            profileImageView.widthAnchor.constraint(equalToConstant: 70),
            profileImageView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        /// Username Label
        NSLayoutConstraint.activate([
            usernameLabel.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor, constant: 0),
            usernameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 2)
        ])
    }
}
