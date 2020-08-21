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
        view.backgroundColor = .red
        view.isUserInteractionEnabled = true
        
        return view
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .white
        scrollView.contentSize.height = 2000
        return scrollView
    }()
    
    let searchIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "search_selected")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let travelersLabel: UILabel = {
        let label = UILabel()
        label.text = "Popular trips from travelers"
        label.textColor = .black
        label.font = UIFont.gilroyBold(ofSize: 14)
        return label
    }()
    
    lazy var travelersCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 5, left: 30, bottom: 5, right: 5)
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.TripsColor.background
        layout.minimumLineSpacing = 20
        return collectionView
    }()
    
    // MARK: Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setSubviewForAutoLayout(scrollView)
        scrollView.setSubviewForAutoLayout(containerView)
        containerView.setSubviewsForAutoLayout([searchIcon])
        
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
        
        NSLayoutConstraint.activate([
            searchIcon.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: 20),
            searchIcon.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20),
            searchIcon.heightAnchor.constraint(equalToConstant: 20),
            searchIcon.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
}
