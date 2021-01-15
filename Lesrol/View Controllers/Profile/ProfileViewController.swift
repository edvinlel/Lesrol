//
//  ProfileViewController.swift
//  Lesrol
//
//  Created by Edvin Lellhame on 8/3/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    weak var profileView: ProfileView! { return self.view as? ProfileView }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view = ProfileView()
        
       
        profileView.logoutButton.addTarget(self, action: #selector(logoutButtonPressed), for: .touchUpInside)
    }
    
    @objc private func logoutButtonPressed() {
        FirebaseLayer.logOut { (success, error) in
            if success {
                let landingViewController = LandingViewController()
                landingViewController.modalPresentationStyle = .fullScreen
                self.present(landingViewController, animated: true, completion: nil)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
