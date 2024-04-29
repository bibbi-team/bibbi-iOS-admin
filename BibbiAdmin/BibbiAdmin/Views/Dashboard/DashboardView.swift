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
                        .roundedBoxStyle(height: 139)
                        
                        DashboardValueBoxView(
                            store.adminDashboardResponse?.totalFamily,
                            of: .totalFamily
                        )
                        .roundedBoxStyle(height: 139)
                        
                        FamilyDistributionBoxView(
                            store.adminDashboardResponse?.familyMemberDistribution
                        )
                        .roundedBoxStyle(height: 139)
                    }
                    
                    DashboardChartsView(
                        store.adminDailyDashboardResponse?.dailyMemberRegistration
                            .toDailyValueResponse()
                            .sorted { $0.date < $1.date }
                            .last(7)
                    )
                    .roundedBoxStyle(height: 288)
                    
                    HStack(spacing: 12) {
                        DashboardValueBoxView(
                            store.adminDashboardResponse?.totalPost,
                            of: .totalPost
                        )
                        .roundedBoxStyle(height: 139)
                        
                        DashboardValueBoxView(
                            store.adminDashboardResponse?.totalComment,
                            of: .totalComment
                        )
                        .roundedBoxStyle(height: 139)
                        
                        DashboardValueBoxView(
                            store.adminDashboardResponse?.totalReaction,
                            of: .totalReaction
                        )
                        .roundedBoxStyle(height: 139)
                    }
                    
                    DashboardChartsView(
                        store.adminDailyDashboardResponse?.dailyPostCreation
                            .toDailyValueResponse()
                            .sorted { $0.date < $1.date }
                            .last(7)
                    )
                    .roundedBoxStyle(height: 288)
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
