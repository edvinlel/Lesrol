//
//  PostView.swift
//  Trips
//
//  Created by Edvin Lellhame on 7/10/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit
import MapKit

class PostView: UIView {
    
    var cachedConstraints = [NSLayoutConstraint]()
    var createTripButtonTopAnchor: NSLayoutConstraint!
    
    let mainContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.isUserInteractionEnabled = true
        
        return view
    }()
    
    let cancelImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "postCancelView")
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Trip Title"
        textField.font = UIFont.gilroyBold(ofSize: 40)
        textField.textColor = UIColor.TripsColor.sectionTitle
        textField.minimumFontSize = 0.1
        textField.adjustsFontSizeToFitWidth = true
        return textField
    }()
    
    let tripDescriptionTextField: UITextView = {
        let textField = UITextView()
        textField.text = "Description"
        textField.font = UIFont.gilroyBold(ofSize: 18)
        textField.textColor = UIColor.TripsColor.paragraphGray
        textField.sizeToFit()
        textField.isScrollEnabled = false
        
        return textField
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.TripsColor.paragraphGray
        return view
    }()
    
    let mapContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.layer.borderColor = UIColor.TripsColor.paragraphGray.cgColor
        view.layer.borderWidth = 0.2
        view.layer.masksToBounds = true
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let mapImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sf")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    let mapLabel: UILabel = {
        let label = UILabel()
        label.text = "Where are we going?"
        label.textColor = .black
        label.font = UIFont.gilroyBold(ofSize: 20)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1
        label.textAlignment = .center
        return label
    }()
    
    let mapView: MKMapView = {
        let view = MKMapView()
        return view
    }()
    
    let switchContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.layer.borderColor = UIColor.TripsColor.paragraphGray.cgColor
        view.layer.borderWidth = 0.2
        view.layer.masksToBounds = true
        return view
    }()
    
    let switchControl: UISwitch = {
        let sc = UISwitch()
        sc.isOn = true
        sc.onTintColor = .black
        return sc
    }()
    
    let publicLabel: UILabel = {
        let label = UILabel()
        label.text = "Friends"
        label.textColor = UIColor.TripsColor.sectionTitle
        label.font = UIFont.gilroyBold(ofSize: 18)
        return label
    }()
    
    let inviteAllLabel: UILabel = {
        let label = UILabel()
        label.text = "Send invite to all friends."
        label.textColor = UIColor.TripsColor.paragraphGray
        label.font = UIFont.gilroyRegular(ofSize: 14)
        return label
    }()
    
    lazy var friendsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    let createTripButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "createTrip"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setSubviewForAutoLayout(mainContainerView)
        mainContainerView.setSubviewsForAutoLayout([cancelImageView, titleTextField, tripDescriptionTextField, separatorView, mapContainerView, switchContainerView, createTripButton])
        mapContainerView.setSubviewsForAutoLayout([ mapLabel, mapView])
        switchContainerView.setSubviewsForAutoLayout([switchControl, publicLabel, inviteAllLabel])
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var heightConstraint: NSLayoutConstraint!
    var topAnchorConstraint: NSLayoutConstraint!
    
    func activateCollectionView(flag: Bool) {
        
        if flag {
            mainContainerView.setSubviewForAutoLayout(friendsCollectionView)
            NSLayoutConstraint.activate([
                friendsCollectionView.topAnchor.constraint(equalTo: switchContainerView.bottomAnchor, constant: 10),
                friendsCollectionView.leftAnchor.constraint(equalTo: switchContainerView.leftAnchor, constant: 0),
                friendsCollectionView.rightAnchor.constraint(equalTo: switchContainerView.rightAnchor, constant: 0),
                friendsCollectionView.bottomAnchor.constraint(equalTo: createTripButton.topAnchor, constant: -5)
            ])
        } else {
            friendsCollectionView.removeFromSuperview()
            NSLayoutConstraint.deactivate(friendsCollectionView.constraints)
        }
    }
    
    private func setConstraints() {
        // Container View
        
        NSLayoutConstraint.activate([
            mainContainerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            mainContainerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            mainContainerView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            

        ])
        ConstraintAnimation.addContainerCachedConstraints = mainContainerView.constraints
        
        
        // Cancel Image
        NSLayoutConstraint.activate([
            cancelImageView.topAnchor.constraint(equalTo: mainContainerView.topAnchor, constant: 20),
            cancelImageView.centerXAnchor.constraint(equalTo: mainContainerView.centerXAnchor),
            cancelImageView.heightAnchor.constraint(equalToConstant: 5),
            cancelImageView.widthAnchor.constraint(equalToConstant: 5)
        ])
        
        
        
        // Title Text Field
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: cancelImageView.bottomAnchor, constant: 25),
            titleTextField.leftAnchor.constraint(equalTo: mainContainerView.leftAnchor, constant: 20),
            titleTextField.rightAnchor.constraint(equalTo: mainContainerView.rightAnchor, constant: -20),
            titleTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        // Trip Description
        NSLayoutConstraint.activate([
            tripDescriptionTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 20),
            tripDescriptionTextField.leftAnchor.constraint(equalTo: titleTextField.leftAnchor, constant: 0),
            tripDescriptionTextField.rightAnchor.constraint(equalTo: mainContainerView.rightAnchor, constant: -10),
            tripDescriptionTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        // Separator View
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: tripDescriptionTextField.bottomAnchor, constant: 25),
            separatorView.leftAnchor.constraint(equalTo: tripDescriptionTextField.leftAnchor, constant: 0),
            separatorView.rightAnchor.constraint(equalTo: mainContainerView.rightAnchor, constant: 0),
            separatorView.heightAnchor.constraint(equalToConstant: 0.5)
        ])
        
        // Map ContainerView
        NSLayoutConstraint.activate([
            mapContainerView.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 20),
            mapContainerView.leftAnchor.constraint(equalTo: mainContainerView.leftAnchor, constant: 20),
            mapContainerView.rightAnchor.constraint(equalTo: mainContainerView.rightAnchor, constant: -20),
            mapContainerView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        
        // Map Label
        NSLayoutConstraint.activate([
            mapLabel.leftAnchor.constraint(equalTo: mapContainerView.leftAnchor, constant: 0),
            mapContainerView.rightAnchor.constraint(equalTo: mapContainerView.rightAnchor, constant: 0),
            mapLabel.centerXAnchor.constraint(equalTo: mapContainerView.centerXAnchor),
            mapLabel.centerYAnchor.constraint(equalTo: mapContainerView.centerYAnchor)
        ])
        
        // MapView
        NSLayoutConstraint.activate([
            mapView.centerXAnchor.constraint(equalTo: mapContainerView.centerXAnchor),
            mapView.centerYAnchor.constraint(equalTo: mapContainerView.centerYAnchor)
        ])
        
        // Switch Container View
        NSLayoutConstraint.activate([
            switchContainerView.topAnchor.constraint(equalTo: mapContainerView.bottomAnchor, constant: 40),
            switchContainerView.leftAnchor.constraint(equalTo: mapContainerView.leftAnchor, constant: 0),
            switchContainerView.rightAnchor.constraint(equalTo: mapContainerView.rightAnchor, constant: 0),
            switchContainerView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        // Switch Control
        NSLayoutConstraint.activate([
            switchControl.centerYAnchor.constraint(equalTo: switchContainerView.centerYAnchor),
            switchControl.rightAnchor.constraint(equalTo: switchContainerView.rightAnchor, constant: -20)
        ])
        
        // Public Label
        NSLayoutConstraint.activate([
            publicLabel.topAnchor.constraint(equalTo: switchContainerView.topAnchor, constant: 20),
            publicLabel.leftAnchor.constraint(equalTo: switchContainerView.leftAnchor, constant: 20)
        ])
        
        // Invite all label
        NSLayoutConstraint.activate([
           inviteAllLabel.topAnchor.constraint(equalTo: publicLabel.bottomAnchor, constant: 10),
           inviteAllLabel.leftAnchor.constraint(equalTo: switchContainerView.leftAnchor, constant: 20)
       ])
        
        // Create Trip Button
        
        createTripButtonTopAnchor = createTripButton.topAnchor.constraint(greaterThanOrEqualTo: switchContainerView.bottomAnchor, constant: 10)
        
        let bottomConstraint = createTripButton.bottomAnchor.constraint(equalTo: mainContainerView.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        
        createTripButtonTopAnchor.priority = UILayoutPriority.defaultHigh
        bottomConstraint.priority = .defaultLow
         
        NSLayoutConstraint.activate([
            createTripButtonTopAnchor,
            bottomConstraint,
            createTripButton.centerXAnchor.constraint(equalTo: mainContainerView.centerXAnchor, constant: 0),
            createTripButton.widthAnchor.constraint(equalToConstant: 243),
            createTripButton.heightAnchor.constraint(equalToConstant: 56)
        ])
        
    }
    
   
    
    
}

