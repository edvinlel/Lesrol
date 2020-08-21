//
//  TextFieldUnderlineView.swift
//  Trips
//
//  Created by Edvin Lellhame on 7/26/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit

class TextFieldUnderlineView: UIView {

    // MARK: Views
    let underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    

    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setSubviewForAutoLayout(underlineView)
        NSLayoutConstraint.activate([
            underlineView.topAnchor.constraint(equalTo: topAnchor),
            underlineView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            underlineView.widthAnchor.constraint(equalToConstant: frame.size.width),
            underlineView.heightAnchor.constraint(equalToConstant: 0.5)
        ])


    }

}
