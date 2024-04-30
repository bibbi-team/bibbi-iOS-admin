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
        fetchDashboard: apiService.requestDashboard,
        fetchDailyDashboard: apiService.requestDailyDashboard(from:to:)
    )
}

extension DependencyValues {
    var dashboardClient: DashboardAPIClient {
        get { self[DashboardAPIClient.self] }
        set { self[DashboardAPIClient.self] = newValue }
    }
}
