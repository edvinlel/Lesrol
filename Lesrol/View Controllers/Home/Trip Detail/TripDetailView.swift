//
//  TripDetailView.swift
//  Lesrol
//
//  Created by Edvin Lellhame on 9/7/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit

class TripDetailView: UIView {
    
    // MARK: Properties
    
    var isInvitedGuest: Bool!
    
    // MARK: Views
    
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.TripsColor.background
        view.isUserInteractionEnabled = true
        
        return view
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = UIColor.TripsColor.background
        return scrollView
    }()

    let locationImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "yellowstone")
        return imageView
    }()
    
    let alphaLocationImage: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.6
        return view
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
//        button.setImage(UIImage(named: "back_white"), for: .normal)
        button.setBackgroundImage(UIImage(named: "back_white"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        return button
    }()
    
    let tripTitle: UILabel = {
        let label = UILabel()
        label.text = "Yellowstone National Park"
        label.numberOfLines = 0
        label.font = UIFont.gilroyBold(ofSize: 30)
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    let datesLabel: UILabel = {
        let label = UILabel()
        label.text = "Oct 2 - Oct 16"
        label.textColor = .white
        label.font = UIFont.gilroyMedium(ofSize: 14)
        return label
    }()
    
    lazy var activitiesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 5, left: 30, bottom: 5, right: 5)
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        layout.minimumLineSpacing = 20
        return collectionView
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "jordanlellhame"
        label.numberOfLines = 0
        label.font = UIFont.gilroyBold(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    let descriptionTextView: UITextView = {
        let view = UITextView()
        view.text = "Quick trip to Yellowstone and Kalispell."
        view.textColor = .white
        view.font = UIFont.gilroyMedium(ofSize: 16)
        view.backgroundColor = .red
        return view
    }()
    
    let joinButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "join_this_trip_small"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        return button
    }()
    
    let viewItineraryButton: UIButton = {
        let button = UIButton()
        button.setTitle("View Itinerary", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.gilroyRegular(ofSize: 14)
        
        return button
    }()
    
    let itineraryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "itinerary_trip_detail")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let todoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "todo_trip_detail")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let chatImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "chat_trip_detail_disabled")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let reservationsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "reservation_trip_detail_disabled")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    // MARK: Initializers
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.TripsColor.background
        
        setSubviewForAutoLayout(scrollView)
        scrollView.setSubviewForAutoLayout(containerView)
        containerView.setSubviewsForAutoLayout([locationImage,
                                                alphaLocationImage,
                                                backButton,
                                                tripTitle,
                                                datesLabel,
//                                                activitiesCollectionView,
                                                viewItineraryButton,
                                                joinButton,
                                                itineraryImageView,
                                                usernameLabel,
                                                descriptionTextView,
                                                
                                                
                                                todoImageView,
                                                chatImageView,
                                                reservationsImageView
        ])
        
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Constraints
    
    
    private func setConstraints() {
        /// Scroll View and Container View
        scrollView.frame = bounds
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            scrollView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            scrollView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            containerView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 0),
            containerView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: 0),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1)
        ])
        
        /// Location image with alpha view layer on top
        NSLayoutConstraint.activate([
            locationImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            locationImage.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0),
            locationImage.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0),
            locationImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height)
        ])
        
        NSLayoutConstraint.activate([
            alphaLocationImage.topAnchor.constraint(equalTo: locationImage.topAnchor, constant: 0),
            alphaLocationImage.leftAnchor.constraint(equalTo: locationImage.leftAnchor, constant: 0),
            alphaLocationImage.rightAnchor.constraint(equalTo: locationImage.rightAnchor, constant: 0),
            alphaLocationImage.heightAnchor.constraint(equalTo: locationImage.heightAnchor, constant: 0)
        ])
        
        /// Back Button
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: alphaLocationImage.safeAreaLayoutGuide.topAnchor, constant: 15),
            backButton.leftAnchor.constraint(equalTo: alphaLocationImage.leftAnchor, constant: 15),
            backButton.heightAnchor.constraint(equalToConstant: 14),
            backButton.widthAnchor.constraint(equalToConstant: 10)
        ])
        
        /// Trip Title
        NSLayoutConstraint.activate([
            tripTitle.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 20),
            tripTitle.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -15),
            tripTitle.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2) + 50)
        ])
        
        /// Dates Label
        NSLayoutConstraint.activate([
            datesLabel.topAnchor.constraint(equalTo: tripTitle.bottomAnchor, constant: 10),
            datesLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -15)
        ])
        
        /// Activities Collection View
//        NSLayoutConstraint.activate([
//            activitiesCollectionView.topAnchor.constraint(equalTo: datesLabel.bottomAnchor, constant: 60),
//            activitiesCollectionView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0),
//            activitiesCollectionView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0),
//            activitiesCollectionView.heightAnchor.constraint(equalToConstant: 500)
//        ])
        
        

        /// Join Button
        NSLayoutConstraint.activate([
            joinButton.bottomAnchor.constraint(equalTo: alphaLocationImage.bottomAnchor, constant: -35),
            joinButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -15),
            joinButton.heightAnchor.constraint(equalToConstant: 51),
            joinButton.widthAnchor.constraint(equalToConstant: 120)
        ])
        
        /// View Itinerary Button
        NSLayoutConstraint.activate([
            viewItineraryButton.centerYAnchor.constraint(equalTo: joinButton.centerYAnchor, constant: 0),
            viewItineraryButton.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 15),
        ])
        
        /// Description Text View
        NSLayoutConstraint.activate([
            descriptionTextView.bottomAnchor.constraint(equalTo: viewItineraryButton.topAnchor, constant: -35),
            descriptionTextView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 15),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        /// Username Label
        NSLayoutConstraint.activate([
            usernameLabel.bottomAnchor.constraint(equalTo: descriptionTextView.topAnchor, constant: -5),
            usernameLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 15)
        ])
        
        /// Reservations
        NSLayoutConstraint.activate([
            itineraryImageView.topAnchor.constraint(equalTo: locationImage.bottomAnchor, constant: 100),
            itineraryImageView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 5),
            itineraryImageView.rightAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0),
            itineraryImageView.heightAnchor.constraint(equalToConstant: 137)
        ])
        
        /// ToDo
        NSLayoutConstraint.activate([
            todoImageView.topAnchor.constraint(equalTo: itineraryImageView.topAnchor, constant: -15),
            todoImageView.leftAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0),
            todoImageView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -5),
            todoImageView.heightAnchor.constraint(equalToConstant: 92)
        ])
        
        /// Chat
        NSLayoutConstraint.activate([
            chatImageView.topAnchor.constraint(equalTo: itineraryImageView.bottomAnchor, constant: 100),
            chatImageView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 5),
            chatImageView.rightAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0),
            chatImageView.heightAnchor.constraint(equalToConstant: 92)
        ])
        
        /// Itinerary
        NSLayoutConstraint.activate([
            reservationsImageView.topAnchor.constraint(equalTo: todoImageView.bottomAnchor, constant: 100),
            reservationsImageView.leftAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0),
            reservationsImageView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -5),
            reservationsImageView.heightAnchor.constraint(equalToConstant: 137),
            reservationsImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -100)
        ])
        
    }
}
