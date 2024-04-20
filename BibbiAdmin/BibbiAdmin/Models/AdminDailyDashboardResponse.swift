//
//  AdminDailyDashboardResponse.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/20/24.
//

import Foundation

struct AdminDailyDashboardResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case dailyMemberRegistration
        case dailyPostCreation
    }
    var dailyMemberRegistration: [DailyValueResponse]
    var dailyPostCreation: [DailyValueResponse]
}
