//
//  Color+Exy.swift
//  BibbiAdmin
//
//  Created by 김건우 on 5/6/24.
//

import SwiftUI

extension Color {
    static var random: Color {
        let randomizedRed = CGFloat.random(in: 0...255)
        let randomizedBlue = CGFloat.random(in: 0...255)
        let randomizedGreen = CGFloat.random(in: 0...255)
        
        let normalizedRed = randomizedRed / 255.0
        let normalizedBlue = randomizedBlue / 255.0
        let normalizedGreen = randomizedGreen / 255.0
        
        return Color(
            red: normalizedRed,
            green: normalizedGreen,
            blue: normalizedBlue
        )
    }
}
