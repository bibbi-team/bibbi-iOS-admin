//
//  DashboardDistributionResponse.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/20/24.
//

import Foundation

struct DashboardDistributionResponse: Decodable {
    enum CodingKeys: String, CodingKeys {
        case count
        case percent
    }
    var count: Int
    var percent: Double
}
