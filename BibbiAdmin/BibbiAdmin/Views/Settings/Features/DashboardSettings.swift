//
//  Settings.swift
//  BibbiAdmin
//
//  Created by 김건우 on 5/2/24.
//

import ComposableArchitecture
import Foundation

@Reducer
struct DashboardSettings {
    
    // MARK: - State
    @ObservableState
    struct State: Equatable { }
    
    // MARK: - Action
    enum Action: BindableAction {
        case binding(BindingAction<State>)
    }
    
    // MARK: - Reducer
    var body: some ReducerOf<Self> {
        BindingReducer()
    }
}
