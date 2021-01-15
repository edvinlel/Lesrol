//
//  PopularDestinationCell.swift
//  Lesrol
//
//  Created by Edvin Lellhame on 9/22/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit

class PopularDestinationCell: UICollectionViewCell {
    
    static let reuseIdentifier = "PopularDestinationCell"
    
    // MARK: Properties
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = false
        return view
    }()
    
    let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let alphaBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.6
        return view
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.gilroyMedium(ofSize: 14)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setSubviewForAutoLayout(containerView)
        containerView.setSubviewsForAutoLayout([backgroundImage, alphaBackground, locationLabel])
        
        setConstraints()
        
        containerView.layer.masksToBounds = true
        containerView.layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        
        /// Background Image
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            backgroundImage.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0),
            backgroundImage.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0),
            backgroundImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0)
        ])
        
        /// Alpha Image
        NSLayoutConstraint.activate([
            alphaBackground.topAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: 0),
            alphaBackground.leftAnchor.constraint(equalTo: backgroundImage.leftAnchor, constant: 0),
            alphaBackground.rightAnchor.constraint(equalTo: backgroundImage.rightAnchor, constant: 0),
            alphaBackground.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: 0)
        ])
        
        /// Location Label
        NSLayoutConstraint.activate([
//            locationLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
//            locationLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10),
//            locationLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -5)
            locationLabel.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor, constant: 0),
            locationLabel.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor, constant: 0),
            locationLabel.leftAnchor.constraint(equalTo: backgroundImage.leftAnchor, constant: 0),
            locationLabel.rightAnchor.constraint(equalTo: backgroundImage.rightAnchor, constant: 0)
        ])
    }
}
