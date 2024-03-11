//
//  BGProvadingClass.swift
//  SwiftDependency
//
//  Created by Ümit Türkmen on 11.03.2024.
//

import Foundation
import UIKit

class BGProvadingClass : BGColorProtocol {
    var backgroundColor: UIColor {
        let backgroundColors : [UIColor] = [.systemGray,.systemRed,.systemOrange,.systemYellow,.systemTeal]
        return backgroundColors.randomElement()!
    }
    
}
