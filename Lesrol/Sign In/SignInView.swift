//
//  SignInView.swift
//  Trips
//
//  Created by Edvin Lellhame on 7/27/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit
import SnapKit

class SignInView: UIView {

    // MARK: Views
    
    let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "goldengatebridge")
        imageView.contentMode = .scaleToFill
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    let backCircularView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "back"), for: .normal)
        return button
    }()
    
    let activityIndicator: ActivityView = {
        let av = ActivityView()
        return av
    }()
    
    let signInLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.gilroyBold(ofSize: 18)
        label.text = "Sign In"
        return label
    }()
    
    let emailBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 0.4
        view.layer.cornerRadius = 5
        return view
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your username"
        textField.font = UIFont.gilroyMedium(ofSize: 14)
        textField.textColor = .black
        return textField
    }()
    
    let passwordBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 0.4
        view.layer.cornerRadius = 5
        return view
    }()
    
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter a password"
        textField.font = UIFont.gilroyMedium(ofSize: 14)
        textField.textColor = .black
        return textField
    }()
    
    let signinButton: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.backgroundColor = .clear
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
   let seperatorView: UIView = {
       let view = UIView()
       view.backgroundColor = .black
       return view
   }()
   
    let orSigninLabel: UILabel = {
        let label = UILabel()
        label.text = "Or Sign In with"
        label.textColor = .black
        label.font = UIFont.gilroyMedium(ofSize: 14)
        return label
    }()
    
    let seperatorTwoView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    lazy var signinWithStackView: UIStackView = { [unowned self] in
        let stackView = UIStackView(arrangedSubviews: [self.seperatorView, self.orSigninLabel, self.seperatorTwoView])
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .fill
        return stackView
    }()
    
    let facebookButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "facebook"), for: .normal)
        return button
    }()
    
    let appleButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "apple"), for: .normal)
        return button
    }()
    
    let googleButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "google"), for: .normal)
        return button
    }()
    
    
    // MARK: Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        /// Initialize View and Constraints
        setSubviewForAutoLayout(backgroundImage)
        backgroundImage.setSubviewsForAutoLayout([signInLabel, emailBackground, passwordBackground, activityIndicator, signinButton, seperatorTwoView, orSigninLabel, seperatorView, facebookButton, appleButton, googleButton])
        emailBackground.setSubviewsForAutoLayout([emailTextField])
        passwordBackground.setSubviewForAutoLayout(passwordTextField)
        setContstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Constraints
    
    private func setContstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            backgroundImage.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            signInLabel.topAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: 150),
            signInLabel.leftAnchor.constraint(equalTo: backgroundImage.leftAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            emailBackground.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 50),
            emailBackground.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor, constant: 0),
            emailBackground.leftAnchor.constraint(equalTo: backgroundImage.leftAnchor, constant: 20),
            emailBackground.rightAnchor.constraint(equalTo: backgroundImage.rightAnchor, constant: -20),
            emailBackground.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            
            
            emailTextField.leftAnchor.constraint(equalTo: emailBackground.leftAnchor, constant: 15),
            emailTextField.topAnchor.constraint(equalTo: emailBackground.topAnchor, constant: 2),
            emailTextField.rightAnchor.constraint(equalTo: emailBackground.rightAnchor, constant: -2),
            emailTextField.centerYAnchor.constraint(equalTo: emailBackground.centerYAnchor, constant: 0)
            
        ])
        
        NSLayoutConstraint.activate([
            passwordBackground.topAnchor.constraint(equalTo: emailBackground.bottomAnchor, constant: 25),
            passwordBackground.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor, constant: 0),
            passwordBackground.leftAnchor.constraint(equalTo: backgroundImage.leftAnchor, constant: 20),
            passwordBackground.rightAnchor.constraint(equalTo: backgroundImage.rightAnchor, constant: -20),
            passwordBackground.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.leftAnchor.constraint(equalTo: passwordBackground.leftAnchor, constant: 15),
            passwordTextField.topAnchor.constraint(equalTo: passwordBackground.topAnchor, constant: 2),
            passwordTextField.rightAnchor.constraint(equalTo: passwordBackground.rightAnchor, constant: -2),
            passwordTextField.centerYAnchor.constraint(equalTo: passwordBackground.centerYAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            signinButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 45),
            signinButton.leftAnchor.constraint(equalTo: passwordBackground.leftAnchor, constant: 0),
            signinButton.rightAnchor.constraint(equalTo: passwordBackground.rightAnchor, constant: 0),
            signinButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            
            orSigninLabel.topAnchor.constraint(equalTo: signinButton.bottomAnchor, constant: 50),
            orSigninLabel.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor, constant: 0),
            orSigninLabel.heightAnchor.constraint(equalToConstant: 50),
            
            seperatorTwoView.centerYAnchor.constraint(equalTo: orSigninLabel.centerYAnchor, constant: 0),
            seperatorTwoView.heightAnchor.constraint(equalToConstant: 1),
            seperatorTwoView.rightAnchor.constraint(equalTo: orSigninLabel.leftAnchor, constant: -20),
            seperatorTwoView.widthAnchor.constraint(equalToConstant: 80),
            
            seperatorView.centerYAnchor.constraint(equalTo: orSigninLabel.centerYAnchor, constant: 0),
            seperatorView.heightAnchor.constraint(equalToConstant: 1),
            seperatorView.leftAnchor.constraint(equalTo: orSigninLabel.rightAnchor, constant: 20),
            seperatorView.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            
            
            appleButton.topAnchor.constraint(equalTo: orSigninLabel.bottomAnchor, constant: 20),
            appleButton.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor, constant: 0),
            appleButton.widthAnchor.constraint(equalToConstant: 25),
            appleButton.heightAnchor.constraint(equalToConstant: 30),
            
            facebookButton.centerYAnchor.constraint(equalTo: appleButton.centerYAnchor, constant: 0),
            facebookButton.rightAnchor.constraint(equalTo: appleButton.leftAnchor, constant: -50),
            facebookButton.widthAnchor.constraint(equalToConstant: 15),
            facebookButton.heightAnchor.constraint(equalToConstant: 35),
            
            googleButton.centerYAnchor.constraint(equalTo: appleButton.centerYAnchor, constant: 0),
            googleButton.leftAnchor.constraint(equalTo: appleButton.rightAnchor, constant: 40),
            googleButton.widthAnchor.constraint(equalToConstant: 53),
            googleButton.heightAnchor.constraint(equalToConstant: 113)
            
        ])
    }
    
}
