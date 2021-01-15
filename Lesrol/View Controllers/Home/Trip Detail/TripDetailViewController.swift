//
//  TripDetailViewController.swift
//  Lesrol
//
//  Created by Edvin Lellhame on 9/7/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit
import Mapbox

class TripDetailViewController: UIViewController {
    
    // MARK: Properties
    
    weak var tripDetailView: TripDetailView! { return self.view as? TripDetailView }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = TripDetailView()
        
        setTargets()
        
        tripDetailView.activitiesCollectionView.register(ActivityCell.self, forCellWithReuseIdentifier: ActivityCell.reuseIdentifier)
        tripDetailView.activitiesCollectionView.delegate = self
        tripDetailView.activitiesCollectionView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: Targets
    
    private func setTargets() {
        /// Back Button
        
        tripDetailView.backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        
    }
    
    @objc private func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    

}


extension TripDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActivityCell.reuseIdentifier, for: indexPath) as! ActivityCell
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width: 300, height: 400)
        
    }
}
