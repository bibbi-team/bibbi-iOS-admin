//
//  DailyValueResponse.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/27/24.
//

import Foundation

struct DailyValueResponse {
    var date: Date
    var count: Int
}

extension DailyValueResponse: Equatable { }

extension DailyValueResponse: Identifiable {
    var id: UUID { UUID() }
}

// MARK: - Mock
extension DailyValueResponse {
    static let mock = [
        Self(date: Date(), count: 10),
        Self(date: Date().addingTimeInterval(-1 * 86_400), count: 10),
        Self(date: Date().addingTimeInterval(-2 * 86_400), count: 20),
        Self(date: Date().addingTimeInterval(-3 * 86_400), count: 30),
        Self(date: Date().addingTimeInterval(-4 * 86_400), count: 40),
        Self(date: Date().addingTimeInterval(-5 * 86_400), count: 30),
        Self(date: Date().addingTimeInterval(-6 * 86_400), count: 20),
        Self(date: Date().addingTimeInterval(-7 * 86_400), count: 10),
        Self(date: Date().addingTimeInterval(-8 * 86_400), count: 20),
        Self(date: Date().addingTimeInterval(-9 * 86_400), count: 90),
    ]
}
