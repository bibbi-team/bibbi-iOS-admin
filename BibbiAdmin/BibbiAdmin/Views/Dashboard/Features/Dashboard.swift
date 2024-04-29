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
        var adminDashboardResponse: AdminDashboardResponse?
        var adminDailyDashboardResponse: AdminDailyDashboardResponse?
        var isLoading: Bool = false
    }
    
    // MARK: - Action
    enum Action {
        case onAppear
        case fetchDashboardResponse
        case dashboardResponse(AdminDashboardResponse)
        case fetchDailyDashboardResponse
        case dailyDashboardResponse(AdminDailyDashboardResponse)
    }
    
    // MARK: - Dependencies
    @Dependency(\.dashboardClient) var dashboard
    
    // MARK: - Reduce
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                state.isLoading = true
                state.adminDashboardResponse = nil
                state.adminDailyDashboardResponse = nil
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
                state.isLoading = false
                state.adminDashboardResponse = response
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
                state.isLoading = false
                state.adminDailyDashboardResponse = response
                return .none
            }
        }
    }
}
