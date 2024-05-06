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
                DashboardTopBarView(store: store)
                    .padding(.vertical)
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 12) {
                    HStack(spacing: 12) {
                        if let store = store.scope(state: \.dashboardValue, action: \.dashboardValue) {
                            DashboardValueBoxView(
                                store: store,
                                of: .totalMember
                            )
                            .roundedBoxStyle(height: 139)
                        } else {
                            ValueBoxPlaceholderView()
                                .roundedBoxStyle(height: 139)
                        }
                        
                        if let store = store.scope(state: \.dashboardValue, action: \.dashboardValue) {
                            DashboardValueBoxView(
                                store: store,
                                of: .totalFamily
                            )
                            .roundedBoxStyle(height: 139)
                        } else {
                            ValueBoxPlaceholderView()
                                .roundedBoxStyle(height: 139)
                        }
                        
                        if let store = store.scope(state: \.dashboardValue, action: \.dashboardValue) {
                            FamilyDistributionBoxView(
                                store: store
                            )
                            .roundedBoxStyle(height: 139)
                        } else {
                            ValueBoxPlaceholderView()
                                .roundedBoxStyle(height: 139)
                        }
                    } 
                    
                    if let store = store.scope(state: \.dashboardDailyMember, action: \.dashboardDailyMember) {
                        DashboardChartsView(
                            store: store,
                            of: .memberRegistration
                        )
                        .roundedBoxStyle(height: 288)
                    } else {
                        ChartsPlaceholderView()
                            .roundedBoxStyle(height: 288)
                    }
                    
                    HStack(spacing: 12) {
                        if let store = store.scope(state: \.dashboardValue, action: \.dashboardValue) {
                            DashboardValueBoxView(
                                store: store,
                                of: .totalPost
                            )
                            .roundedBoxStyle(height: 139)
                        } else {
                            ValueBoxPlaceholderView()
                                .roundedBoxStyle(height: 139)
                        }
                        
                        if let store = store.scope(state: \.dashboardValue, action: \.dashboardValue) {
                            DashboardValueBoxView(
                                store: store,
                                of: .totalComment
                            )
                            .roundedBoxStyle(height: 139)
                        } else {
                            ValueBoxPlaceholderView()
                                .roundedBoxStyle(height: 139)
                        }
                        
                        if let store = store.scope(state: \.dashboardValue, action: \.dashboardValue) {
                            DashboardValueBoxView(
                                store: store,
                                of: .totalReaction
                            )
                            .roundedBoxStyle(height: 139)
                        } else {
                            ValueBoxPlaceholderView()
                                .roundedBoxStyle(height: 139)
                        }
                    }
                    
                    if let store = store.scope(state: \.dashboardDailyPost, action: \.dashboardDailyPost) {
                        DashboardChartsView(
                            store: store,
                            of: .postCreation
                        )
                        .roundedBoxStyle(height: 288)
                    } else {
                        ChartsPlaceholderView()
                            .roundedBoxStyle(height: 288)
                    }
                    
                    VStack(spacing: 12) {
                        Text("마지막 업데이트 시간: \(store.refreshDate.toFormatString(.yyyyMDHMS))")
                            .font(.system(size: 14))
                            .foregroundStyle(Color.secondary)
                        Button("새로고침") {
                            store.send(.refresh)
                        }
                        #if os(iOS)
                        .tint(Color.mainYellow)
                        #endif
                    }
                    .padding(.vertical)
                }
            }
            .padding(.horizontal, 40)
            .safeAreaPadding(.bottom)
        }
        .sheet(
            item: $store.scope(state: \.dailyMemberList, action: \.dailyMemberList)
        ) { store in
            ChartsListView(
                store: store,
                of: .member
            )
            #if os(macOS)
            .frame(width: 600, height: 500)
            #endif
        }
        .sheet(
            item: $store.scope(state: \.dailyPostList, action: \.dailyPostList)
        ) { store in
            ChartsListView(
                store: store,
                of: .post
            )
            #if os(macOS)
            .frame(width: 600, height: 500)
            #endif
        }
        .onAppear {
            store.send(.onAppear)
        }
    }
}

// MARK: - Extensions
extension DashboardView {
    
}

// MARK: - Preview
#Preview {
    DashboardView(store:
        .init(initialState: Dashboard.State()) {
            Dashboard()
        }
    )
}
