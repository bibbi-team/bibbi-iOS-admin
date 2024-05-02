//
//  Dashboard.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/25/24.
//

import ComposableArchitecture
import Foundation

@Reducer
struct Dashboard {
    
    // MARK: - State
    @ObservableState
    struct State: Equatable {
        var endDate: Date = Date()
        var startDate: Date = Date().addingTimeInterval(-50 * 86_400)
    
        var dashboardTopBar: DashboardTopBar.State?
        var dashboardValue: DashboardValue.State?
        var dashboardDailyMember: DashboardCharts.State?
        var dashboardDailyPost: DashboardCharts.State?
    }
    
    // MARK: - Action
    enum Action {
        case onAppear
        case fetchDashboardResponse
        case dashboardResponse(AdminDashboardResponse)
        case fetchDailyDashboardResponse
        case dailyDashboardResponse(AdminDailyDashboardResponse)
        
        case dashboardTopBar(DashboardTopBar.Action)
        case dashboardValue(DashboardValue .Action)
        case dashboardDailyMember(DashboardCharts.Action)
        case dashboardDailyPost(DashboardCharts.Action)
    }
    
    // MARK: - Dependencies
    @Dependency(\.dashboardClient) var dashboard
    
    // MARK: - Reduce
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                state.dashboardTopBar = DashboardTopBar.State()
                return .merge(
                    .send(.fetchDashboardResponse),
                    .send(.fetchDailyDashboardResponse)
                )
                
            case .fetchDashboardResponse:
                return .run { send in
                    await send(.dashboardResponse(
                        try await self.dashboard.fetchDashboard()
                    ))
                } catch: { error, _ in
                    print(error.localizedDescription)
                }
                
            case let .dashboardResponse(response):
                state.dashboardValue = DashboardValue.State(
                    value: response
                )
                return .none
                
            case .fetchDailyDashboardResponse:
                return .run { [
                    startDate = state.startDate,
                    endDate = state.endDate
                ] send in
                    let _endDate = endDate.toFormatString(.dashYyyyMmDd)
                    let _startDate = startDate.toFormatString(.dashYyyyMmDd)
                    
                    await send(.dailyDashboardResponse(
                        try await self.dashboard.fetchDailyDashboard(
                            from: _startDate,
                            to: _endDate
                        )
                    ))
                } catch: { error, _ in
                    print(error.localizedDescription)
                }
                
            case let.dailyDashboardResponse(response):
                state.dashboardDailyMember = DashboardCharts.State(
                    values: response.dailyMemberValues
                )
                state.dashboardDailyPost = DashboardCharts.State(
                    values: response.dailyPostValues
                )
                return .none
                
            case .dashboardTopBar,
                 .dashboardValue,
                 .dashboardDailyMember,
                 .dashboardDailyPost:
                return .none
            }
        }
        .ifLet(\.dashboardTopBar, action: \.dashboardTopBar) {
            DashboardTopBar()
        }
        .ifLet(\.dashboardValue, action: \.dashboardValue) {
            DashboardValue()
        }
        .ifLet(\.dashboardDailyMember, action: \.dashboardDailyMember) {
            DashboardCharts()
        }
        .ifLet(\.dashboardDailyPost, action: \.dashboardDailyPost) {
            DashboardCharts()
        }
    }
}
