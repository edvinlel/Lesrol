//
//  YourTripCell.swift
//  Trips
//
//  Created by Edvin Lellhame on 7/31/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit

class YourTripTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: YourTripCollectionViewCell.reuseIdentifier, for: indexPath) as! YourTripCollectionViewCell
        if indexPath.row == 0 {
            cell.hideView()
        }
        cell.setCell()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width: 120, height: 160)
        
    }
    
    
    // MARK: Views
    
    lazy var yourTripCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 5, left: 30, bottom: 5, right: 5)
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.TripsColor.background
        layout.minimumLineSpacing = 20
        return collectionView
    }()
    
    
    // MARK: Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setSubviewForAutoLayout(yourTripCollectionView)
        
        setConstraints()
        
        yourTripCollectionView.register(YourTripCollectionViewCell.self, forCellWithReuseIdentifier: YourTripCollectionViewCell.reuseIdentifier)
        yourTripCollectionView.delegate = self
        yourTripCollectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Helper Methods
    
    func setCell() {
        
    }
    
    // MARK: Constraints
    private func setConstraints() {
        /// CollectionView
        NSLayoutConstraint.activate([
            yourTripCollectionView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            yourTripCollectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            yourTripCollectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            yourTripCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}
