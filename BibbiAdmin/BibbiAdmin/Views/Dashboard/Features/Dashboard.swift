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
        var startDate: Date = Date()
        var endDate: Date = Date().addingTimeInterval(-50 * 86_400)
        var isLoading: Bool = false
    
        var dashboardTopBar: DashboardTopBar.State?
        var dashboardAdmin: DashboardAdmin.State?
        var dashboardCharts: DashboardCharts.State?
    }
    
    // MARK: - Action
    enum Action {
        case onAppear
        case fetchDashboardResponse
        case dashboardResponse(AdminDashboardResponse)
        case fetchDailyDashboardResponse
        case dailyDashboardResponse(AdminDailyDashboardResponse)
        case isLoadingEnabled(Bool)
        
        case dashboardTopBar(DashboardTopBar.Action)
        case dashboardAdmin(DashboardAdmin.Action)
        case dashboardCharts(DashboardCharts.Action)
    }
    
    // MARK: - Dependencies
    @Dependency(\.dashboardClient) var dashboard
    
    // MARK: - Reduce
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                state.dashboardAdmin = DashboardAdmin.State()
                state.dashboardCharts = DashboardCharts.State()
                return .concatenate(
                    .send(.isLoadingEnabled(true)),
                    .send(.fetchDashboardResponse),
                    .send(.fetchDailyDashboardResponse),
                    .send(.isLoadingEnabled(false))
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
                state.dashboardAdmin = DashboardAdmin.State(
                    response: response
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
                state.dashboardCharts = DashboardCharts.State(
                    response: response
                )
                return .none
                
            case let .isLoadingEnabled(enable):
                state.dashboardTopBar = DashboardTopBar.State(
                    isLoading: enable
                )
                return .none
                
            case .dashboardTopBar:
                return .none
                
            case .dashboardAdmin:
                return .none
                
            case .dashboardCharts:
                return .none
            }
        }
        .ifLet(\.dashboardTopBar, action: \.dashboardTopBar) {
            DashboardTopBar()
        }
        .ifLet(\.dashboardAdmin, action: \.dashboardAdmin) {
            DashboardAdmin()
        }
        .ifLet(\.dashboardCharts, action: \.dashboardCharts) {
            DashboardCharts()
        }
    }
}
