//
//  ExploreView.swift
//  Lesrol
//
//  Created by Edvin Lellhame on 8/7/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit

class ExploreView: UIView {
    
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
        scrollView.contentSize.height = 2000
        return scrollView
    }()
    
    
    let searchBar: UIImageView = {
        let button = UIImageView()
        button.contentMode = .scaleAspectFill
        button.image = UIImage(named: "searchButton")
        button.isUserInteractionEnabled = true
        return button
    }()
    
    let popularDestinationsLabel: UILabel = {
        let label = UILabel()
        label.text = "Popular trips from travelers"
        label.textColor = .black
        label.font = UIFont.gilroyBold(ofSize: 14)
        return label
    }()
    
    lazy var popularDestinationsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 5, left: 40, bottom: 5, right: 5)
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        layout.minimumLineSpacing = 10
        return collectionView
    }()
    
    let adSpot: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "disney_ad")
        return imageView
    }()
    
    // MARK: Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setSubviewForAutoLayout(scrollView)
        scrollView.setSubviewForAutoLayout(containerView)
        containerView.setSubviewsForAutoLayout([
            searchBar,
            popularDestinationsLabel,
            popularDestinationsCollectionView,
            adSpot
        
        ])
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Constraints
    
    private func setConstraints() {
        /// scroll view
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
        
        /// Search bar
        NSLayoutConstraint.activate([
            searchBar.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0),
            searchBar.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: 50),
            searchBar.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 40),
            searchBar.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -40)
        ])
        
        /// Travelers Label and Collection View
        NSLayoutConstraint.activate([
            popularDestinationsLabel.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 40),
            popularDestinationsLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 40),
            
            popularDestinationsCollectionView.topAnchor.constraint(equalTo: popularDestinationsLabel.bottomAnchor, constant: 5),
            popularDestinationsCollectionView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0),
            popularDestinationsCollectionView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0),
            popularDestinationsCollectionView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        /// Ad Spot
        NSLayoutConstraint.activate([
            adSpot.topAnchor.constraint(equalTo: popularDestinationsCollectionView.bottomAnchor, constant: 0),
            adSpot.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20),
            adSpot.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -10),
            adSpot.heightAnchor.constraint(equalToConstant: 265)
        ])
    }
}
