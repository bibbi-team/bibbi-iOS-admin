//
//  DashboardTopBar.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/29/24.
//

import ComposableArchitecture
import Foundation

@Reducer
struct DashboardTopBar {
    
    // MARK: - State
    @ObservableState
    struct State: Equatable {
        var isLoading: Bool = false
    }
    
    // MARK: - Action
    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case refreshButtonTapped
    }
    
    // MARK: - Reducer
    var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .binding:
                return .none
                
            case .refreshButtonTapped:
                return .none
            }
        }
    }
}
