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
        
        setTargets()
        
        exploreView.popularDestinationsCollectionView.register(PopularDestinationCell.self, forCellWithReuseIdentifier: PopularDestinationCell.reuseIdentifier)
        exploreView.popularDestinationsCollectionView.delegate = self
        exploreView.popularDestinationsCollectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: Targets
    
    private func setTargets() {
        /// Search Bar
        exploreView.searchBar.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(searchButtonPressed)))
    }
    
    @objc private func searchButtonPressed() {
        let searchViewController = SearchViewController()
        navigationController?.pushViewController(searchViewController, animated: true)
    }
}

extension ExploreViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularDestinationCell.reuseIdentifier, for: indexPath) as! PopularDestinationCell
        cell.locationLabel.text = "hello"
        cell.backgroundImage.image = UIImage(named: "yellowstone")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width: 120, height: 160)
        
    }
    
    
}
