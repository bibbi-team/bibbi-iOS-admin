//
//  DailyMemberDetail.swift
//  BibbiAdmin
//
//  Created by 김건우 on 5/6/24.
//

import ComposableArchitecture
import Foundation

@Reducer
struct ChartsList {
    
    // MARK: - State
    @ObservableState
    struct State: Equatable {
        var values: [DailyValueResponse]?
    }
    
    // MARK: - Action
    enum Action {
        case dismiss
    }
    
    // MARK: - Dependencies
    @Dependency(\.dismiss) var dismiss
    
    // MARK: - Reducer
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .dismiss:
                return .run { send in
                    await self.dismiss()
                }
            }
        }
    }
    
}
