//
//  DashboardAdmin.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/29/24.
//

import ComposableArchitecture
import Foundation

@Reducer
struct DashboardAdmin {
    
    // MARK: - State
    @ObservableState
    struct State: Equatable {
        var response: AdminDashboardResponse?
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
