//
//  ExploreViewController.swift
//  Lesrol
//
//  Created by Edvin Lellhame on 8/3/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController {
    
    weak var exploreView: ExploreView! { return  self.view as? ExploreView }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view = ExploreView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
}
