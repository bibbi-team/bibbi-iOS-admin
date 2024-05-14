//
//  DashboardTopBarView.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/20/24.
//

import ComposableArchitecture
import SwiftUI

struct DashboardTopBarView: View {
    
    // MARK: - Store
    let store: StoreOf<DashboardTopBar>
    
    // MARK: - Body
    var body: some View {
        topBar
            .padding(.horizontal, 40)
    }
}

// MARK: - Extensions
extension DashboardTopBarView {
    var topBar: some View {
        HStack {
            Image(.logo)
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .contentShape(Rectangle())
                .onTapGesture {
                    store.send(.bibbiLogoTapped)
                }
            
            Text(BibbiUserInterfaceString.dashboard)
                .font(.system(size: 24, weight: .black, design: .rounded))
                .foregroundStyle(Color.bibbiWhite)
            
            Spacer()
            
            Text(BibbiUserInterfaceString.bibbi)
                .font(.system(size: 24, weight: .black, design: .rounded))
                .foregroundStyle(Color.bibbiWhite)
        }
    }
}

// MARK: - Preview
#Preview {
    DashboardTopBarView(
        store: StoreOf<DashboardTopBar>(initialState: DashboardTopBar.State()) {
            DashboardTopBar()
        }
    )
}
