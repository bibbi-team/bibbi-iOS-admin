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

extension DailyValueResponse: Identifiable {
    var id: UUID { UUID() }
}
