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
        var values: [DailyValueResponse]?
        var rawSelectedDate: Date?
        var selectedDate: Date?
        var selectedValue: DailyValueResponse?
    }
    
    // MARK: - Dependencies
    @Dependency(\.charts) var charts
    @Dependency(\.calendar) var calendar
    
    // MARK: - Action
    enum Action: BindableAction {
        case binding(BindingAction<State>)
    }
    
    // MARK: - Reducer
    var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .binding(\.rawSelectedDate):
                state.selectedDate = charts.checkVaildSelection(
                    on: state.rawSelectedDate,
                    values: state.values
                )
                state.selectedValue = charts.checkVaildValue(
                    on: state.rawSelectedDate,
                    values: state.values
                )
                return .none
                
            case .binding:
                return .none
            }
        }
        
    }
}
