//
//  LocationViewController.swift
//  Trips
//
//  Created by Edvin Lellhame on 7/12/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {
    
    let backImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "back")
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .yellow
        
        
        
        view.setSubviewsForAutoLayout([backImageView])
        
        setConstraints()
        
        backImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backButtonPressed)))
    }
    
    @objc private func backButtonPressed() {
        
    }
    
    private func setConstraints() {
        // Back ImageView
        NSLayoutConstraint.activate([
            backImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            backImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            backImageView.heightAnchor.constraint(equalToConstant: 20),
            backImageView.widthAnchor.constraint(equalToConstant: 15)
        ])
    }
    
    func se() {
        
    }

}


