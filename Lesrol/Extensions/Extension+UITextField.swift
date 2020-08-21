//
//  Extension+UITextField.swift
//  Trips
//
//  Created by Edvin Lellhame on 7/26/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit

extension UITextField {
    internal func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
