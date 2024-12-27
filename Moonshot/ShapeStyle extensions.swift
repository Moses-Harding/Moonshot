//
//  ShapeStyle extensions.swift
//  Moonshot
//
//  Created by Moses Harding on 12/27/24.
//

import Foundation
import SwiftUI

// ShapeStyle is a protocol that lets us use colors, gradients, materials, and more as if they were the same thing.
extension ShapeStyle where Self == Color {
    static var darkBackground: Color {
        Color(red: 0.1, green: 0.1, blue: 0.2)
    }

    static var lightBackground: Color {
        Color(red: 0.2, green: 0.2, blue: 0.3)
    }
}
