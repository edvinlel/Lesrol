//
//  HomeView.swift
//  Lesrol
//
//  Created by Edvin Lellhame on 8/3/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit

class HomeView: UIView {
    
    let spaceView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.TripsColor.background
        return view
    }()
    
    let lesrolLogo: UILabel = {
        let label = UILabel()
        label.text = "lesrol"
        label.textColor = .black
        label.font = UIFont.gilroyMedium(ofSize: 35)
        return label
    }()
    
    let compassImage: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "compass"), for: .normal)
        return button
    }()
    
    let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.TripsColor.paragraphGray
        view.alpha = 0.4
        return view
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear
        return tableView
    }()

    override init(frame: CGRect) {
           super.init(frame: frame)
           
        backgroundColor = UIColor.TripsColor.background
    
           setSubviewForAutoLayout(spaceView)
           spaceView.setSubviewsForAutoLayout([lesrolLogo, compassImage, dividerView])
           setSubviewForAutoLayout(tableView)
           setConstraints()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
       
       // MARK: Constraints
       
       private func setConstraints() {
        /// SpaceView for in between top of phone and tableView
        NSLayoutConstraint.activate([
            spaceView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            spaceView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            spaceView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            spaceView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        
        /// Lesrol ImageView
        NSLayoutConstraint.activate([
            lesrolLogo.centerXAnchor.constraint(equalTo: spaceView.centerXAnchor),
            lesrolLogo.centerYAnchor.constraint(equalTo: spaceView.centerYAnchor, constant: 0)
        ])
           
        /// Compass Button
        NSLayoutConstraint.activate([
            compassImage.centerYAnchor.constraint(equalTo: spaceView.centerYAnchor, constant: 0),
            compassImage.rightAnchor.constraint(equalTo: spaceView.rightAnchor, constant: -15),
            compassImage.heightAnchor.constraint(equalToConstant: 30),
            compassImage.widthAnchor.constraint(equalToConstant: 30)
        ])
           
           /// Divider View
           NSLayoutConstraint.activate([
               dividerView.bottomAnchor.constraint(equalTo: spaceView.bottomAnchor, constant: 0),
               dividerView.leftAnchor.constraint(equalTo: spaceView.leftAnchor, constant: 0),
               dividerView.rightAnchor.constraint(equalTo: spaceView.rightAnchor, constant: 0),
               dividerView.heightAnchor.constraint(equalToConstant: 1)
           ])
           
           /// UpcomigTableView
           NSLayoutConstraint.activate([
               tableView.topAnchor.constraint(equalTo: spaceView.bottomAnchor, constant: 0),
               tableView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
               tableView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
               tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
           ])
       }
    
}
