

//  MainTabBarController.swift
//  Trips
//
//  Created by Edvin Lellhame on 6/28/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.


import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.backgroundColor = .white
        tabBar.barTintColor = .white
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)

        delegate = self

        // Original Viewcontrollers order
        viewControllers = [createHomeNavigationController(), createExploreListNavigationController(), createAddViewController(), createMessagesViewController(), createProfileViewController()]

     }


     func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        /// Popup presentation for the PostViewController
       if viewController.isKind(of: PostViewController.self) {
          let addVC =  PostViewController()
        
          addVC.modalPresentationStyle = .overCurrentContext
          addVC.modalTransitionStyle = .crossDissolve

          self.present(addVC, animated: false, completion: nil)
          return false
       }
       return true
     }

    /// Set the title and image for each tab view controller
    private func tabBarTitle(for viewController: UIViewController, title: String, withImage name: String, selectedImage: String) {

        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = UIImage(named: name)
        viewController.tabBarItem.selectedImage = UIImage(named: selectedImage)!.withRenderingMode(.alwaysOriginal)

     }


    /// Set the tint color for the tabbar text
    func configureNavigationBar() {
        UINavigationBar.appearance().tintColor = .black
    }

    // MARK: Create ViewController
    func createHomeNavigationController() -> UINavigationController {
        let homeVC = HomeViewController()

        tabBarTitle(for: homeVC, title: "Home", withImage: "home_unselected", selectedImage: "home_selected")

        return UINavigationController(rootViewController: homeVC)
    }

     func createExploreListNavigationController() -> UINavigationController {
         let exploreVC = ExploreViewController()

         tabBarTitle(for: exploreVC, title: "Explore", withImage: "search_unselected", selectedImage: "search_selected")
         return UINavigationController(rootViewController: exploreVC)
     }

     func createAddViewController() -> UIViewController {
         let addVC = PostViewController()

         tabBarTitle(for: addVC, title: "Create Trip", withImage: "post_unselected", selectedImage: "post_unselected")
         return addVC
     }

     func createMessagesViewController() -> UINavigationController {
         let notificationVC = InboxViewController()

         tabBarTitle(for: notificationVC, title: "Inbox", withImage: "inbox_unselected", selectedImage: "inbox_selected")
         return UINavigationController(rootViewController: notificationVC)
     }

     func createProfileViewController() -> UIViewController {
         let profileVC = ProfileViewController()

         tabBarTitle(for: profileVC, title: "Profile", withImage: "profile_unselected", selectedImage: "profile_selected")
         return profileVC
     }
}

