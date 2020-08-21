//
//  Extension+UIFont.swift
//  Trips
//
//  Created by Edvin Lellhame on 6/28/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit

// TODO: Find a way to use only one function for all 3 uses

extension UIFont {
    
    class func gilroyRegular(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Gilroy-Regular", size: size)!
    }
    
    class func gilroyMedium(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Gilroy-Medium", size: size)!
    }
    
    class func gilroyBold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Gilroy-Bold", size: size)!
    }
    
    
}
