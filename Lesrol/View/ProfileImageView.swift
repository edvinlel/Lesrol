//
//  ProfileImageView.swift
//  Trips
//
//  Created by Edvin Lellhame on 6/29/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit

class ProfileImageView: UIView {
    
    // MARK: Views
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.gilroyBold(ofSize: 10)
        label.minimumScaleFactor = 0.1
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    // MARK: Properties
    
    // Boolean to check if the profile image should have a shadow layer around it.
    var applyShadow = false
    var isComingFromCollectionView = false
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        layer.cornerRadius = frame.size.height / 2
        clipsToBounds = false

        setSubviewForAutoLayout(imageView)
//        NSLayoutConstraint.activate([
//            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
//            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
//            imageView.widthAnchor.constraint(equalToConstant: frame.size.width),
//            imageView.heightAnchor.constraint(equalToConstant: frame.size.height)
//        ])
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            imageView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])

        imageView.layer.cornerRadius = frame.size.height / 2

        if applyShadow {
            layer.applySketchShadow(color: .lightGray, alpha: 1.0, x: 0, y: 2, blur: 17, spread: 0)
        }

        
        setSubviewForAutoLayout(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
//        NSLayoutConstraint.activate([
//            label.topAnchor.constraint(equalTo: topAnchor, constant: 0),
//            label.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
//            label.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
//            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
//        ])

    }
    
    /// Sets the users profile image
    func setImageView(image: UIImage?) {
        guard let image = image else {
            if isComingFromCollectionView {
                label.font = UIFont.gilroyBold(ofSize: 10)
                imageView.backgroundColor = .white
                label.text = "😀"
                isComingFromCollectionView = false
            } else {
                imageView.backgroundColor = .white
                label.text = "😀"
            }
            
            return
        }
        
        imageView.image = image
        
    }
    
    /// Only used if guest count is greater than 4. Updates the count of remaining guests confirmed but not shown in TripDetailViewController.
    func setLabel(text: String) {
        if isComingFromCollectionView {
            label.text = text
            label.font = UIFont.gilroyBold(ofSize: 10)
            isComingFromCollectionView = false
        } else {
            label.text = text
        }
        
        
    }
    

}
