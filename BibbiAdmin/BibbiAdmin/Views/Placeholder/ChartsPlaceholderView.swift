//
//  ChartsPlaceholderView.swift
//  BibbiAdmin
//
//  Created by 김건우 on 5/3/24.
//

import SwiftUI

struct ChartsPlaceholderView: View {
    
    // MARK: - Properties
    var randomLineCount: Int {
        Int.random(in: 3...5)
    }
    
    var randomLetterCount: Int {
        Int.random(in: 10...70)
    }
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text("Placeholder")
                .font(.system(size: 12))
            
            Text("1234")
                .font(.system(size: 36, weight: .semibold))
            
            VStack(alignment: .leading) {
                ForEach(0..<randomLineCount, id: \.self) { _ in
                    Text(String(repeating: "*", count: randomLetterCount))
                }
            }
            
            
            Spacer()
            
            HStack {
                Spacer()
                
                HStack(spacing: 2) {
                    Text("Placeholder+Placeholder")
                        .font(.system(size: 10, weight: .bold))
                }
            }
        }
        .redacted(reason: .placeholder)
        .shimmering()
    }
}

#Preview {
    ChartsPlaceholderView()
        .roundedBoxStyle(height: 228)
}
