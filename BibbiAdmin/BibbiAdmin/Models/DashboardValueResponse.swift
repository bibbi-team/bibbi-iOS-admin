//
//  DashboardValueResponse.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/20/24.
//

import Foundation

struct DashboardValueResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case count
        case gapBetweenYesterday
        case percentBetweenYesterday
    }
    var count: Int
    var gapBetweenYesterday: Int
    var percentBetweenYesterday: Double
}

extension DashboardValueResponse: Identifiable {
    var id: UUID { UUID() }
}

extension DashboardValueResponse: Equatable { }

// MARK: - Mock Data
extension DashboardValueResponse {
    static let mock = Self(
        count: 12,
        gapBetweenYesterday: 53,
        percentBetweenYesterday: -33.33333
    )
}
