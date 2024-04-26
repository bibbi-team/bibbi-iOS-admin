//
//  DashboardDistributionResponse.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/20/24.
//

import Foundation

struct DashboardDistributionResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case count
        case percent
    }
    var count: Int
    var percent: Double
}

extension DashboardDistributionResponse: Identifiable {
    var id: UUID { UUID() }
}

extension DashboardDistributionResponse: Equatable { }

// MARK: - Mock
extension DashboardDistributionResponse {
    static let mock = [
        Self(
            count: 4,
            percent: 40.5
        ),
        Self(
            count: 5,
            percent: 32.5
        ),
        Self(
            count: 3,
            percent: 11.2
        ),
        Self(
            count: 8,
            percent: 9.2
        ),
        Self(
            count: 2,
            percent: 4
        ),
        Self(
            count: 1,
            percent: 3.5
        ),
        Self(
            count: 12,
            percent: 2
        ),
        Self(
            count: 43,
            percent: 0.1
        ),
    ]
}
