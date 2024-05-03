//
//  RoundedBoxStyle.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/26/24.
//

import SwiftUI

struct RoundedBox: ViewModifier {
    
    // MARK: - Properties
    let _height: CGFloat
    
    // MARK: - Intitalizer
    init(height: CGFloat) {
        self._height = height
    }
    
    func body(content: Content) -> some View {
        content
            .padding(.top, 12)
            .padding(.bottom, 14)
            .padding(.horizontal)
            .frame(height: _height)
            .frame(maxWidth: .infinity)
            .background(
                Color.gray800,
                in: RoundedRectangle(cornerRadius: 12)
            )
    }
    
}

// MARK: - Extensions
extension View {
    func roundedBoxStyle(height: CGFloat) -> some View {
        modifier(RoundedBox(height: height))
    }
}
