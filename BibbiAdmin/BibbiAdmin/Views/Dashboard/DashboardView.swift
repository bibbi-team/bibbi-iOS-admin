//
//  DashboardView.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/20/24.
//

import ComposableArchitecture
import SwiftUI

struct DashboardView: View {
    
    // MARK: - Store
    let store: StoreOf<Dashboard>
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 0) {
            DashboardTopBarView()
                .padding(.top)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 12) {
                    HStack(spacing: 12) {
                        DashboardValueBoxView(
                            store.adminDashboardResponse?.totalMember,
                            of: .totalMember
                        )
                        
                        DashboardValueBoxView(
                            store.adminDashboardResponse?.totalFamily,
                            of: .totalFamily
                        )
                        
                        DashboardValueBoxView(
                            store.adminDashboardResponse?.totalPost,
                            of: .totalPost
                        )
                    }
                    
                    HStack(spacing: 12) {
                        DashboardValueBoxView(
                            store.adminDashboardResponse?.totalComment,
                            of: .totalComment
                        )
                        
                        DashboardValueBoxView(
                            store.adminDashboardResponse?.totalReaction,
                            of: .totalReaction
                        )
                        
                        DashboardValueBoxView(
                            store.adminDashboardResponse?.totalMember,
                            of: .totalMember
                        )
                    }
                }
            }
            .onAppear {
                store.send(.fetchDashboardResponse)
            }
            .padding(.horizontal, 40)
            .safeAreaPadding(.vertical)
        }
    }
}

// MARK: - Preview
#Preview {
    DashboardView(store:
        .init(initialState: Dashboard.State()) {
            Dashboard()
        }
    )
}
