//
//  DashboardChart.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/29/24.
//

import ComposableArchitecture
import Foundation

@Reducer
struct DashboardCharts {
    
    // MARK: - State
    @ObservableState
    struct State: Equatable {
        var response: AdminDailyDashboardResponse?
        var selectedDate: Date?
        
        var dailyMemberValues: [DailyValueResponse]? {
            guard response != nil else { return nil }
            return response?.dailyMemberRegistration
                .toDailyValueResponse()
                .sorted { $0.date < $1.date }
                .last(7)
        }
        
        var dailyPostValues: [DailyValueResponse]? {
            guard response != nil else { return nil }
            return response?.dailyPostCreation
                .toDailyValueResponse()
                .sorted { $0.date < $1.date }
                .last(7)
        }
    }
    
    // MARK: - Action
    enum Action: BindableAction {
        case binding(BindingAction<State>)
    }
    
    // MARK: - Reducer
    var body: some ReducerOf<Self> {
        BindingReducer()
    }
    
}
