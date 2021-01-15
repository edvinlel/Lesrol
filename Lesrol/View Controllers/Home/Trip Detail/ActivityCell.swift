//
//  ActivityCell.swift
//  Lesrol
//
//  Created by Edvin Lellhame on 9/8/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit
import Mapbox

class ActivityCell: UICollectionViewCell {
    
    
    // MARK: Reuse Identifier
    
    static let reuseIdentifier = "ActivityCell"
    
    // MARK: Properties
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = false
        return view
    }()
    
    let dayLabel: UILabel = {
        let label = UILabel()
        label.text = "Day 1"
        label.textColor = UIColor.TripsColor.mainBlack
        label.font = UIFont.gilroyBold(ofSize: 18)
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Oct 2"
        label.textColor = UIColor.TripsColor.mainBlack
        label.font = UIFont.gilroyBold(ofSize: 22)
        return label
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.isScrollEnabled = false
        tableView.backgroundColor = .clear
        tableView.rowHeight = 25
        return tableView
    }()
    
    let mapContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = false
        return view
    }()
    
    let mapView: MGLMapView = {
        let view = MGLMapView()
        view.styleURL = URL(string: "mapbox://styles/edvinlel/ckew5cn8f096o19p65m2b67m4")
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        let latitude = 43.8069
        let longitude = -116.74588
        view.setCenter(CLLocationCoordinate2D(latitude: latitude, longitude: longitude), zoomLevel: 15, animated: false)
        view.logoView.isHidden = true
        view.attributionButton.alpha = 0
        view.isUserInteractionEnabled = false
        
        let marker = MGLPointAnnotation()
        
        marker.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        view.addAnnotation(marker)
        return view
    }()
    
    // MARK: Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setSubviewForAutoLayout(containerView)
        containerView.setSubviewsForAutoLayout([dayLabel,
                                                dateLabel,
                                                tableView,
                                                mapContainerView
        ])
        mapContainerView.setSubviewForAutoLayout(mapView)
        
        setConstraints()
        
        containerView.layer.cornerRadius = 15
        containerView.layer.masksToBounds = true
        
        mapContainerView.layer.cornerRadius = 15
        mapContainerView.layer.masksToBounds = true
        
        tableView.register(DayCell.self, forCellReuseIdentifier: DayCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        mapView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Constraints
    
    private func setConstraints() {
        /// Container View
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            containerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            containerView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
        
        /// Day label
        NSLayoutConstraint.activate([
            dayLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            dayLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20)
        ])
        
        /// Date Label
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: 2),
            dateLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20)
        ])
        
        /// TableView
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 15),
            tableView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20),
            tableView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20),
            tableView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        /// Map ContainerView
        NSLayoutConstraint.activate([
            mapContainerView.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 25),
            mapContainerView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0),
            mapContainerView.heightAnchor.constraint(equalToConstant: 120),
            mapContainerView.widthAnchor.constraint(equalToConstant: 220)
        ])
        
        /// MapView
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: mapContainerView.topAnchor, constant: 0),
            mapView.leftAnchor.constraint(equalTo: mapContainerView.leftAnchor, constant: 0),
            mapView.rightAnchor.constraint(equalTo: mapContainerView.rightAnchor, constant: 0),
            mapView.bottomAnchor.constraint(equalTo: mapContainerView.bottomAnchor, constant: 0)
        ])
    }
}

extension ActivityCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DayCell.reuseIdentifier, for: indexPath) as! DayCell
        
        
        return cell
    }
    
    
}


extension ActivityCell: MGLMapViewDelegate {
    func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
     
        // Create point to represent where the symbol should be placed
        let point = MGLPointAnnotation()
        point.coordinate = mapView.centerCoordinate
         
        // Create a data source to hold the point data
        let shapeSource = MGLShapeSource(identifier: "marker-source", shape: point, options: nil)
         
        // Create a style layer for the symbol
        let shapeLayer = MGLSymbolStyleLayer(identifier: "marker-style", source: shapeSource)
         
        // Add the image to the style's sprite
        if let image = UIImage(named: "house-icon") {
        style.setImage(image, forName: "home-symbol")
        }
         
        // Tell the layer to use the image in the sprite
        shapeLayer.iconImageName = NSExpression(forConstantValue: "home-symbol")
         
        // Add the source and style layer to the map
        style.addSource(shapeSource)
        style.addLayer(shapeLayer)
    }
    func mapView(_ mapView: MGLMapView, fillColorForPolygonAnnotation annotation: MGLPolygon) -> UIColor {
        return .black
    }
}
