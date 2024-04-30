//
//  AdminDashboardResponse.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/20/24.
//

import Foundation

struct AdminDashboardResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case totalMember
        case totalFamily
        case totalPost
        case totalComment
        case totalReaction
        case familyMemberDistribution
    }
    var totalMember: DashboardValueResponse
    var totalFamily: DashboardValueResponse
    var totalPost: DashboardValueResponse
    var totalComment: DashboardValueResponse
    var totalReaction: DashboardValueResponse
    var familyMemberDistribution: [DashboardDistributionResponse]
}

extension AdminDashboardResponse: Identifiable {
    var id: UUID { UUID() }
}

extension AdminDashboardResponse: Equatable {
    static func == (lhs: AdminDashboardResponse, rhs: AdminDashboardResponse) -> Bool {
        return lhs.id == rhs.id
    }
}

// MARK: - Mock

extension AdminDashboardResponse {
    static let mock = Self(
        totalMember: DashboardValueResponse.mock,
        totalFamily: DashboardValueResponse.mock,
        totalPost: DashboardValueResponse.mock,
        totalComment: DashboardValueResponse.mock,
        totalReaction: DashboardValueResponse.mock,
        familyMemberDistribution: DashboardDistributionResponse.mock
    )
}
