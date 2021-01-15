//
//  YourTripCollectionViewCell.swift
//  Trips
//
//  Created by Edvin Lellhame on 7/31/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit

class YourTripCollectionViewCell: UICollectionViewCell {
    
    // MARK: Properties
    
    static let reuseIdentifier = "TripCell"
    
    // MARK: Views
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = false
        return view
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let addButton: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "addButton")
        imageView.isHidden = true
        return imageView
    }()
    
    let addNewLabel: UILabel = {
        let label = UILabel()
        label.text = "Add new"
        label.textColor = .black
        label.font = UIFont.gilroyMedium(ofSize: 12)
        label.isHidden = true
        return label
    }()
    
    let alphaView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.4
        return view
    }()
    
    let profilePicture: ProfileImageView = {
        let iv = ProfileImageView()
        iv.setImageView(image: UIImage(named: "jordan"))
        return iv
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.gilroyRegular(ofSize: 14)
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.1
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.text = "jordanlellhame"
        return label
    }()
    
    
    
    func hideView() {
        imageView.isHidden = true
        alphaView.isHidden = true
        profilePicture.isHidden = true
        usernameLabel.isHidden = true
        addButton.isHidden = false
        addNewLabel.isHidden = false
    }
    
    // MARK: Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setSubviewForAutoLayout(containerView)
        containerView.setSubviewsForAutoLayout([imageView, addButton, addNewLabel])
        imageView.setSubviewsForAutoLayout([alphaView, profilePicture,  usernameLabel])
        
        
        setConstraints()
        
        containerView.layer.cornerRadius = 15
        containerView.layer.masksToBounds = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Helper Methods
    
    func setCell() {
        imageView.image = UIImage(named: "yellowstone")
    }
    
    
    // MARK: Constraints
    
    private func setConstraints() {
        /// Container View
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            containerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            containerView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
        
        /// ImageView
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            imageView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0),
            imageView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0)
        ])
        
        /// Profile Picture
        NSLayoutConstraint.activate([
            profilePicture.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: 0),
            profilePicture.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: 0),
            profilePicture.heightAnchor.constraint(equalToConstant: 60),
            profilePicture.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        /// Alpha View
        NSLayoutConstraint.activate([
            alphaView.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 0),
            alphaView.leftAnchor.constraint(equalTo: imageView.leftAnchor, constant: 0),
            alphaView.rightAnchor.constraint(equalTo: imageView.rightAnchor, constant: 0),
            alphaView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 0)
        ])
        
        /// Trip Label
        NSLayoutConstraint.activate([
            usernameLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: 0),
            usernameLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor, constant: 5),
            usernameLabel.rightAnchor.constraint(equalTo: imageView.rightAnchor, constant: -5),
            usernameLabel.topAnchor.constraint(equalTo: profilePicture.bottomAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            addButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0),
            addButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: -20),
            addButton.heightAnchor.constraint(equalToConstant: 35),
            addButton.widthAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            addNewLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0),
            addNewLabel.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 20)
        ])
       
    }
}
