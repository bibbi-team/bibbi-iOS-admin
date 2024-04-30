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
    var dailyMemberRegistration: [String: Int]
    var dailyPostCreation: [String: Int]
}

extension AdminDailyDashboardResponse: Identifiable {
    var id: UUID { UUID() }
}

extension AdminDailyDashboardResponse: Equatable { }

extension AdminDailyDashboardResponse {
    var dailyMemberValues: [DailyValueResponse]? {
        return dailyMemberRegistration
            .toDailyValueResponse()
            .sorted { $0.date < $1.date }
            .last(7)
    }
    
    var dailyPostValues: [DailyValueResponse]? {
        return dailyPostCreation
            .toDailyValueResponse()
            .sorted { $0.date < $1.date }
            .last(7)
    }
}

// MARK: - Mock
extension AdminDailyDashboardResponse {
    static let mock = Self(
        dailyMemberRegistration: [
            "\(Date().toFormatString(.dashYyyyMmDd))": 10,
            "\(Date(timeIntervalSinceNow: -1 * 86_400).toFormatString(.dashYyyyMmDd))": 20,
            "\(Date(timeIntervalSinceNow: -2 * 86_400).toFormatString(.dashYyyyMmDd))": 50,
            "\(Date(timeIntervalSinceNow: -3 * 86_400).toFormatString(.dashYyyyMmDd))": 40,
            "\(Date(timeIntervalSinceNow: -4 * 86_400).toFormatString(.dashYyyyMmDd))": 30,
            "\(Date(timeIntervalSinceNow: -5 * 86_400).toFormatString(.dashYyyyMmDd))": 80,
            "\(Date(timeIntervalSinceNow: -6 * 86_400).toFormatString(.dashYyyyMmDd))": 10
        ],
        dailyPostCreation: [
            "\(Date().toFormatString(.dashYyyyMmDd))": 30,
            "\(Date(timeIntervalSinceNow: -1 * 86_400).toFormatString(.dashYyyyMmDd))": 60,
            "\(Date(timeIntervalSinceNow: -2 * 86_400).toFormatString(.dashYyyyMmDd))": 90,
            "\(Date(timeIntervalSinceNow: -3 * 86_400).toFormatString(.dashYyyyMmDd))": 10,
            "\(Date(timeIntervalSinceNow: -4 * 86_400).toFormatString(.dashYyyyMmDd))": 20,
            "\(Date(timeIntervalSinceNow: -5 * 86_400).toFormatString(.dashYyyyMmDd))": 50,
            "\(Date(timeIntervalSinceNow: -6 * 86_400).toFormatString(.dashYyyyMmDd))": 30
        ]
    )
}
