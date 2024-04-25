//
//  DashboardAPIClient.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/25/24.
//

import ComposableArchitecture
import Foundation

@DependencyClient
struct DashboardAPIClient {
    var fetchDashboard: () async throws -> AdminDashboardResponse
    var fetchDailyDashboard: (_ from: String, _ to: String) async throws -> AdminDailyDashboardResponse
}

extension DashboardAPIClient: DependencyKey {
    static let apiService = DashboardAPIService()
    
    static let liveValue = Self(
        fetchDashboard: {
            try await apiService.requestDashboard()
        },
        fetchDailyDashboard: { startDate, endDate in
            try await apiService.requestDailyDashboard(
                from: startDate,
                to: endDate
            )
        }
    )
}

extension DependencyValues {
    var dashboardClient: DashboardAPIClient {
        get { self[DashboardAPIClient.self] }
        set { self[DashboardAPIClient.self] = newValue }
    }
}
