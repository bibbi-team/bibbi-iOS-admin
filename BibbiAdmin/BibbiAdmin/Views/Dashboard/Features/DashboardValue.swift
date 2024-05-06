//
//  DashboardAdmin.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/29/24.
//

import ComposableArchitecture
import Foundation

@Reducer
struct DashboardValue {
    
    // MARK: - State
    @ObservableState
    struct State: Equatable {
        var value: AdminDashboardResponse?
        
        func value(of type: DashboardValueType) -> DashboardValueResponse? {
            switch type {
            case .totalMember:
                return value?.totalMember
            case .totalFamily:
                return value?.totalFamily
            case .totalPost:
                return value?.totalPost
            case .totalComment:
                return value?.totalComment
            case .totalReaction:
                return value?.totalReaction
            }
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
