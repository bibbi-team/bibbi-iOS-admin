//
//  DailyValueResponse.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/20/24.
//

import Foundation

struct DailyValueResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case date
        case count
    }
    var date: String
    var count: Int
}
