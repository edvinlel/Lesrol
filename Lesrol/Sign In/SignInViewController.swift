//
//  SignInViewController.swift
//  Trips
//
//  Created by Edvin Lellhame on 7/7/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {
    
    
    
    // MARK: Properties
    
    weak var signInView: SignInView! { return self.view as? SignInView }
    
    var comingFromLanding = false // Boolean to check if the user is coming from the LandingViewController or not.
    var comingFromSignUp = false
    // MARK: View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = SignInView()
        
        setTargets()
    }
    
    // MARK: Set Targets
    
    private func setTargets() {
        /// Submit Button
//        let submitButtonGesture = UITapGestureRecognizer(target: self, action: #selector(submitButtonPressed))
//        signInView.submitButton.addGestureRecognizer(submitButtonGesture)
//        
//        /// Sign In Button
//        signInView.signUpButton.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
//        
//        /// Email TextField
//        signInView.emailTextField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
//        
//        /// Password TextField
//        signInView.passwordTextField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
    }
    
    // MARK: Targets
    
    @objc private func signInButtonPressed() {
        /// If the user is coming from LandingViewController, initiate and launch SignUpViewController
        /// If the user is already coming from the SignUp page, we don't want to push another SignUpViewController
        /// on top of the stack so we will just dismiss and pop the view.
        
            let signUpViewController = SignUpViewController()
            signUpViewController.modalPresentationStyle = .fullScreen
            present(signUpViewController, animated: true, completion: nil)
        
    }
    
    @objc private func submitButtonPressed() {
        /// Show and start the activity indicator.
        signInView.activityIndicator.startActivitySpinner(flag: true)
        /// Log the user in
//        FirebaseLayer.login(withEmail: signInView.emailTextField.text ?? "", password: signInView.passwordTextField.text ?? "") { (success, errorString) in
//
//            if success {
//                /// Present the main page if successful sign in.
//                let mainTabBar = MainTabBarController()
//                mainTabBar.modalPresentationStyle = .fullScreen
//                self.present(mainTabBar, animated: true, completion: nil)
//            } else {
//                /// Present the user with the error message.
//                self.signInView.errorMessageLabel.text = errorString!
//            }
//
//            /// Hide and stop the activity indicator.
//            self.signInView.activityIndicator.startActivitySpinner(flag: false)
//        }
    }
    
    /// Validate the text fields.
    @objc func handleTextInputChange() {
//        let isFormValid = signInView.emailTextField.text?.isEmpty == false  && signInView.passwordTextField.text?.isEmpty == false
//        let isEmailValid = signInView.emailTextField.isValidEmail(signInView.emailTextField.text ?? "")
//        
//        if isEmailValid && isFormValid {
//            signInView.submitButton.isSubmitButtonDisabled(flag: false, imageName: "signin")
//        } else {
//            signInView.submitButton.isSubmitButtonDisabled(flag: true, imageName: "signin")
//        }
    }
    
    

    
}



