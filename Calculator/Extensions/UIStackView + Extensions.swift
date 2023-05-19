//
//  UIStackView + Extensions.swift
//  Calculator
//
//  Created by Sergey Kykhov on 09.11.2022.
//

import UIKit

extension UIStackView {
    convenience init(subviews:[UIView]) {
        self.init(arrangedSubviews: subviews)
        self.axis = .horizontal
        self.spacing = 1
        self.distribution = .fillEqually
    }
}
