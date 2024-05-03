//
//  ValueBoxPlaceholderView.swift
//  BibbiAdmin
//
//  Created by 김건우 on 5/3/24.
//

import SwiftUI

struct ValueBoxPlaceholderView: View {
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text("Placeholder")
                .font(.system(size: 12))
            
            Text("1234")
                .font(.system(size: 36, weight: .semibold))
            
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
    ValueBoxPlaceholderView()
        .roundedBoxStyle(height: 139)
}
