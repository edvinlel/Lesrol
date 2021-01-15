//
//  Extension+UIColor.swift
//  Trips
//
//  Created by Edvin Lellhame on 6/28/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit

extension UIColor {
    
    /// Helper method to eliminate the need to / 255.0 for the red, green and blue values. Alpha
    /// is set to 1.
    ///
    /// - Parameters:
    ///   - red: CGFloat value for the red hue.
    ///   - green: CGFloat value for the green hue.
    ///   - blue: CGFloat value for the blue hue.
    class func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1)
    }
    
    /// Freelance project color theme
    struct TripsColor {
        /// Background color for every screen
        static var background: UIColor { return UIColor.rgb(red: 244, green: 244, blue: 247) }
        
        /// Main light red used throughout the app
        static var mainRed: UIColor { return UIColor.rgb(red: 255, green: 91, blue: 96) }
        
        /// Used for titles
        static var sectionTitle: UIColor { return UIColor.rgb(red: 62, green: 62, blue: 63) }
        
        /// Used for trip titles
        static var tripTitle: UIColor { return UIColor.rgb(red: 93, green: 93, blue: 93 ) }
        
        /// Light gray text used throughout the application
        static var paragraphGray: UIColor { return UIColor.rgb(red: 178, green: 177, blue: 177) }
        
        /// Ratings yellow
        static var ratingYellow: UIColor { return UIColor.rgb(red: 224, green: 184, blue: 112) }
        
        /// Main black
        static var mainBlack: UIColor { return UIColor.rgb(red: 31, green: 31, blue: 31) }
    }
}
