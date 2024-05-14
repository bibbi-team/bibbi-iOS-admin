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
    
    // MARK: - Properties
    static let xAxisLength = 7
    
    // MARK: - State
    @ObservableState
    struct State: Equatable {
        var endDate: Date = Date._now
        var startDate: Date = Date._20240110
        
        var refreshDate: Date = Date._now
    
        var dailyMember: [DailyValueResponse]?
        var dailyPost: [DailyValueResponse]?
        
        @Presents var dailyMemberList: ChartsList.State?
        @Presents var dailyPostList: ChartsList.State?
        @Presents var easterEgg: EasterEgg.State?
        @Presents var dashboardSettings: DashboardSettings.State?
        
        var dashboardTopBar: DashboardTopBar.State?
        var dashboardValue: DashboardValue.State?
        var dashboardDailyMember: DashboardCharts.State?
        var dashboardDailyPost: DashboardCharts.State?
    }
    
    // MARK: - Action
    enum Action {
        case onAppear
        case refresh
        case fetchDashboardResponse
        case dashboardResponse(AdminDashboardResponse)
        case fetchDailyDashboardResponse
        case dailyDashboardResponse(AdminDailyDashboardResponse)
        
        case settingsButtonTapped
        
        case dailyMemberList(PresentationAction<ChartsList.Action>)
        case dailyPostList(PresentationAction<ChartsList.Action>)
        case easterEgg(PresentationAction<EasterEgg.Action>)
        case dashboardSettings(PresentationAction<DashboardSettings.Action>)
        
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
                
            case .refresh:
                state.dashboardValue = nil
                state.dashboardDailyMember = nil
                state.dashboardDailyPost = nil
                state.refreshDate = Date._now
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
                state.dailyPost = response.dailyPostValues { $0.date > $1.date }
                state.dailyMember = response.dailyMemberValues { $0.date > $1.date }
                
                state.dashboardDailyMember = DashboardCharts.State(
                    values: response.dailyMemberValues(Dashboard.xAxisLength)
                )
                state.dashboardDailyPost = DashboardCharts.State(
                    values: response.dailyPostValues(Dashboard.xAxisLength)
                )
                return .none
                
            case .dashboardTopBar(.bibbiLogoTapped):
                state.easterEgg = EasterEgg.State(
                    poem: Poem.models.randomElement()
                )
                return .none
                
            case .dashboardDailyMember(.listButtonTapped):
                state.dailyMemberList = ChartsList.State(
                    values: state.dailyMember
                )
                return .none
                
            case .dashboardDailyPost(.listButtonTapped):
                state.dailyPostList = ChartsList.State(
                    values: state.dailyPost
                )
                return .none
                
            case .settingsButtonTapped:
                state.dashboardSettings = DashboardSettings.State()
                return .none
                
            case .dashboardTopBar,
                 .dashboardValue,
                 .dashboardDailyMember,
                 .dashboardDailyPost:
                return .none
                
            case .dailyMemberList,
                 .dailyPostList:
                return .none
                
            case .dashboardSettings,
                 .easterEgg:
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
        .ifLet(\.$dailyMemberList, action: \.dailyMemberList) {
            ChartsList()
        }
        .ifLet(\.$dailyPostList, action: \.dailyPostList) {
            ChartsList()
        }
        .ifLet(\.$easterEgg, action: \.easterEgg) {
            EasterEgg()
        }
    }
}
