//
//  SignUpButtonView.swift
//  Trips
//
//  Created by Edvin Lellhame on 7/26/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit

class SignUpButtonView: UIView {
    
    // MARK: Views
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    

    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setSubviewForAutoLayout(imageView)
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: frame.size.width),
            imageView.heightAnchor.constraint(equalToConstant: frame.size.height)
        ])


    }
    
    /// If the text fields are not valid, disable the button and change image
    /// If the text fields are valid, enable the button and use proper image.
    func isSubmitButtonDisabled(flag: Bool, imageName: String) {
        if flag {
            imageView.isUserInteractionEnabled = false
            imageView.image = UIImage(named: "\(imageName)Disabled")
        } else {
            imageView.isUserInteractionEnabled = true
            imageView.image = UIImage(named: "\(imageName)")
        }
    }
    

}

