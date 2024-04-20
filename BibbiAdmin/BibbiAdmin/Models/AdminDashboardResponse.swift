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
    var familyMemberDistribution: DashboardDistributionResponse
}
