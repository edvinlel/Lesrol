//
//  SearchCell.swift
//  Trips
//
//  Created by Edvin Lellhame on 7/30/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit
import MapboxGeocoder

class SearchCell: UITableViewCell {
    
    // MARK: Properties
    
    static let reuseId = "SearchCell"
    
    // MARK: Views
    
    let placemarkNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.TripsColor.sectionTitle
        label.font = UIFont.gilroyBold(ofSize: 22)
        return label
    }()
    
    let placemarkQualifiedNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.TripsColor.paragraphGray
        label.font = UIFont.gilroyRegular(ofSize: 14)
        return label
    }()
    
    // MARK: Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setSubviewsForAutoLayout([placemarkNameLabel, placemarkQualifiedNameLabel])
        
        setConstraints()
        
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Helper Methods
    
    func setCell(placemark: GeocodedPlacemark) {
        placemarkNameLabel.text = placemark.name
        placemarkQualifiedNameLabel.text = placemark.qualifiedName
    }
    
    // MARK: Constraints
    
    private func setConstraints() {
        /// Placemark Name
        NSLayoutConstraint.activate([
            placemarkNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            placemarkNameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            placemarkNameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20)
        ])
        
        /// Placemark Qualified Name Label
        NSLayoutConstraint.activate([
            placemarkQualifiedNameLabel.topAnchor.constraint(equalTo: placemarkNameLabel.bottomAnchor, constant: 0),
            placemarkQualifiedNameLabel.leftAnchor.constraint(equalTo: placemarkNameLabel.leftAnchor, constant: 0),
            placemarkQualifiedNameLabel.rightAnchor.constraint(equalTo: placemarkNameLabel.rightAnchor, constant: 0)
        ])
    }
}
