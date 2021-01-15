//
//  TripCell.swift
//  Trips
//
//  Created by Edvin Lellhame on 6/28/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit

class TripCell: UITableViewCell {
    
    // MARK: Properties
    
    // TODO: Remove one.
    static let upcomingReuseId = "upcomingCell"
    static let invitedReuseId = "invitedCell"
    
    
    
    // MARK: Views
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        return view
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Yellowstone National Park"
        label.font = UIFont.gilroyBold(ofSize: 30)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.minimumScaleFactor = 0.1
        label.textColor = .white
        return label
    }()
    
    let likeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "like"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        return button
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "jordanlellhame"
        label.textColor = .white
        label.font = UIFont.gilroyBold(ofSize: 14)
        return label
    }()
    
    
    
    let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.image = UIImage(named: "yellowstone")
        return imageView
    }()
    
    let alphaView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.5
        view.layer.cornerRadius = 20
        return view
    }()
    

    let profilePicture: ProfileImageView = {
        let imageView = ProfileImageView()
        imageView.setImageView(image: UIImage(named: "jordan"))
        return imageView
    }()
    
    let tripTitle: UILabel = {
        let label = UILabel()
        label.text = "Matt's Bachelor Party"
        label.font = UIFont.gilroyBold(ofSize: 14)
        label.textColor = .white
        label.text = "Yellowstone"
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.1
        label.textAlignment = .left
        return label
    }()
    
    let datesLabel: UILabel = {
        let label = UILabel()
        label.text = "Oct 2 - Oct 16"
        label.textColor = .white
        label.font = UIFont.gilroyMedium(ofSize: 14)
        return label
    }()
    
    let firstFriendProfileImage: ProfileImageView = {
        let imageView = ProfileImageView()
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 1
        imageView.setImageView(image: UIImage(named: "edvin"))
        return imageView
    }()
    
    let secondFriendProfileImage: ProfileImageView = {
        let imageView = ProfileImageView()
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 1
        imageView.setImageView(image: UIImage(named: "joey"))
        return imageView
    }()
    
    let thirdFriendProfileImage: ProfileImageView = {
        let imageView = ProfileImageView()
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 1
        imageView.setImageView(image: UIImage(named: "jordan"))
        return imageView
    }()
    
    let remainingFriendProfileImage: ProfileImageView = {
        let imageView = ProfileImageView()
        imageView.backgroundColor = .white
        imageView.label.textColor = .black
        imageView.setLabel(text: "+4")
        return imageView
    }()
    
    lazy var groupsStackView: UIStackView = { [unowned self] in
        let stackView = UIStackView(arrangedSubviews: [self.firstFriendProfileImage, self.secondFriendProfileImage, self.thirdFriendProfileImage, self.remainingFriendProfileImage])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = -10
        return stackView
    }()
    
    let locationIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "locationWhite")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    // MARK: Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        selectionStyle = .none
        
        setSubviewsForAutoLayout([containerView])
        containerView.setSubviewsForAutoLayout([backgroundImage,
                                                alphaView,
                                                locationIcon,
                                                usernameLabel,
                                                profilePicture,
                                                locationLabel,
                                                tripTitle,
                                                datesLabel,
                                                groupsStackView,
                                                likeButton])
        
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Helper Methods
    
    func setCell(withTrip trip: Trip) {
//        backgroundImage.image = trip.backgroundImage
//        tripTitle.text = trip.title
//        timestampLabel.text = "\(trip.totalGuests) guests"
//        usernameLabel.text = trip.user.username
//        profileImage.setImageView(image:  trip.user.profileImage)
    }
    
    
    // MARK: Constraints
    
    private func setConstraints() {
        
        /// Container View
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            containerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 30),
            containerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -30),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
        
        /// Background Image
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            backgroundImage.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0),
            backgroundImage.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0),
            backgroundImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            alphaView.topAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: 0),
            alphaView.leftAnchor.constraint(equalTo: backgroundImage.leftAnchor, constant: 0),
            alphaView.rightAnchor.constraint(equalTo: backgroundImage.rightAnchor, constant: 0),
            alphaView.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: 0)
        ])
        
        /// Profile Picture
        NSLayoutConstraint.activate([
            profilePicture.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15),
            profilePicture.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 15),
            profilePicture.heightAnchor.constraint(equalToConstant: 60),
            profilePicture.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        /// Username Label
        NSLayoutConstraint.activate([
            usernameLabel.centerYAnchor.constraint(equalTo: profilePicture.centerYAnchor, constant: 0),
            usernameLabel.leftAnchor.constraint(equalTo: profilePicture.rightAnchor, constant: 10),
        ])
        
        /// Like Button
        NSLayoutConstraint.activate([
            likeButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -15),
            likeButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -15),
            likeButton.widthAnchor.constraint(equalToConstant: 30),
            likeButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
      
        
        /// Dates Label
        NSLayoutConstraint.activate([
            datesLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10),
            datesLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0)
            
        ])
        
        /// Location Icon
        NSLayoutConstraint.activate([
            locationIcon.centerYAnchor.constraint(equalTo: locationLabel.centerYAnchor, constant: 0),
            locationIcon.rightAnchor.constraint(equalTo: locationLabel.leftAnchor, constant: -15),
            locationIcon.widthAnchor.constraint(equalToConstant: 15),
            locationIcon.heightAnchor.constraint(equalToConstant: 10)
        ])
        
        /// Location Label
        NSLayoutConstraint.activate([
            locationLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0),
            locationLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0),
            locationLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 5),
            locationLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -5)
        ])
        
        /// Trip Title
        NSLayoutConstraint.activate([
            tripTitle.bottomAnchor.constraint(equalTo: groupsStackView.topAnchor, constant: -20),
            tripTitle.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 15)
//            tripTitle.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 15),
//            tripTitle.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -15)
        ])
        
        /// Group StackView
        NSLayoutConstraint.activate([
            firstFriendProfileImage.widthAnchor.constraint(equalToConstant: 30),
            firstFriendProfileImage.heightAnchor.constraint(equalToConstant: 30),
            
            secondFriendProfileImage.widthAnchor.constraint(equalToConstant: 30),
            secondFriendProfileImage.widthAnchor.constraint(equalToConstant: 30),
            
            thirdFriendProfileImage.widthAnchor.constraint(equalToConstant: 30),
            thirdFriendProfileImage.heightAnchor.constraint(equalToConstant: 30),
            
            remainingFriendProfileImage.widthAnchor.constraint(equalToConstant: 30),
            remainingFriendProfileImage.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        /// Friends
        NSLayoutConstraint.activate([
            
            groupsStackView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 15),
            groupsStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -15)
//            groupsStackView.bottomAnchor.constraint(equalTo: tripTitle.topAnchor, constant: -20),
//            groupsStackView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 15)
        ])
        
        
//        /// Background Image
//        NSLayoutConstraint.activate([
//            backgroundImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
//            backgroundImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
//            backgroundImage.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
//            backgroundImage.heightAnchor.constraint(equalToConstant: 190)
//        ])
        
        
        
    }
    
    
    
}
