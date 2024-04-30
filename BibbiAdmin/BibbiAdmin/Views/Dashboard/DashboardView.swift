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
    @Bindable var store: StoreOf<Dashboard>
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 0) {
            if let store = store.scope(state: \.dashboardTopBar, action: \.dashboardTopBar) {
                DashboardTopBarView()
                    .padding(.top)
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 12) {
                    HStack(spacing: 12) {
                        if let store = store.scope(state: \.dashboardAdmin, action: \.dashboardAdmin) {
                            DashboardValueBoxView(
                                store: store,
                                of: .totalMember
                            )
                            .roundedBoxStyle(height: 139)
                            
                            DashboardValueBoxView(
                                store: store,
                                of: .totalFamily
                            )
                            .roundedBoxStyle(height: 139)
                            
                            FamilyDistributionBoxView(
                                store: store
                            )
                            .roundedBoxStyle(height: 139)
                        }
                    }
                    
                    if let store = store.scope(state: \.dashboardCharts, action: \.dashboardCharts) {
                        DashboardChartsView(
                            store: store
                        )
                        .roundedBoxStyle(height: 288)
                    }
                    
                    HStack(spacing: 12) {
                        if let store = store.scope(state: \.dashboardAdmin, action: \.dashboardAdmin) {
                            DashboardValueBoxView(
                                store: store,
                                of: .totalPost
                            )
                            .roundedBoxStyle(height: 139)
                            
                            DashboardValueBoxView(
                                store: store,
                                of: .totalComment
                            )
                            .roundedBoxStyle(height: 139)
                            
                            DashboardValueBoxView(
                                store: store,
                                of: .totalReaction
                            )
                            .roundedBoxStyle(height: 139)
                        }
                    }
                    
                    if let store = store.scope(state: \.dashboardCharts, action: \.dashboardCharts) {
                        DashboardChartsView(
                            store: store
                        )
                        .roundedBoxStyle(height: 288)
                    }
                }
            }
            .onAppear {
                store.send(.onAppear)
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
