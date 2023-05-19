//
//  String + Extension.swift
//  Calculator
//
//  Created by Sergey Kykhov on 14.11.2022.
//

import Foundation

extension String {
    var stringWithPoint: String {
        self.contains(".") ? self.replacingOccurrences(of: ".", with: ",") : self
    }
}
