//
//  Extensions.swift
//  DigioStore
//
//  Created by Mateus Eduardo Taufer dos Santos on 13/07/24.
//

import Foundation
import UIKit

extension UIView {
    func round( _ radious: CGFloat = 10) {
        self.layer.cornerRadius = radious
        self.clipsToBounds = true
    }
    
    func addBorder(color: UIColor, width: CGFloat) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
}
