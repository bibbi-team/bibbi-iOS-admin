//
//  DashboardTopBarView.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/20/24.
//

import SwiftUI

struct DashboardTopBarView: View {
    
    // MARK: - Body
    var body: some View {
        HStack {
            Image(.logo)
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
            
            Text(BibbiUserInterfaceString.dashboard)
                .font(.system(size: 24, weight: .black, design: .rounded))
                .foregroundStyle(Color.bibbiWhite)
            
            Spacer()
            
            Text(BibbiUserInterfaceString.bibbi)
                .font(.system(size: 24, weight: .black, design: .rounded))
                .foregroundStyle(Color.bibbiWhite)
        }
        .padding(.horizontal, 40)
    }
}

// MARK: - Preview
#Preview {
    DashboardTopBarView()
}
