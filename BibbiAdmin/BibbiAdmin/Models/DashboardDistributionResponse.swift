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
