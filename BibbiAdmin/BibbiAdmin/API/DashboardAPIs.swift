//
//  DashboardAPIs.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/20/24.
//

import Foundation

enum DashboardAPIs: API {
    case dashboard
    case daily(from: String, to: String)
    
    var spec: APISpec {
        switch self {
        case .dashboard:
            return APISpec(method: .get, url: "\(AdminAPI.hostApi)/dashboard")
        case let .daily(startDate, endDate):
            return APISpec(method: .get, url: "\(AdminAPI.hostApi)/dashboard/daily?fromDate=\(startDate)&toDate=\(endDate)")
        }
    }
}
