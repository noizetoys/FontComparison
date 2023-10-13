//
//  CGFloat Extensions.swift
//  FontComparison
//
//  Created by Apple User on 9/4/23.
//

import Foundation

/// Returns string with 'n' points of precision
/// Defaults to 0
extension CGFloat {
    func precisionString(_ precision: Int = 0) -> String {
        String(format: "%.\(precision)f", self)
    }
}


