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
        case gepBetweenYesturday
        case percentBetweenYesturday
    }
    var count: Int
    var gepBetweenYesturday: Int
    var percentBetweenYesturday: Double
}
