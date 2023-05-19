//
//  Double + Extensions.swift
//  Calculator
//
//  Created by Sergey Kykhov on 14.11.2022.
//

import Foundation

extension Double {
    var stringWithoutZeroFraction: String {
        truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
