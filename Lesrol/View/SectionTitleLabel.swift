//
//  SectionTitleLabel.swift
//  Trips
//
//  Created by Edvin Lellhame on 6/29/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit

class SectionTitleLabel: UILabel {

    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Helper Methods
    
    /// Sets the labels color and font.
    private func setLabel() {
        textColor = UIColor.TripsColor.sectionTitle
//        font = UIFont.avenirBold(ofSize: 30)
    }

}
