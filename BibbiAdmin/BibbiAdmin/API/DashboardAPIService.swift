//
//  DashboardAPIService.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/20/24.
//

import Combine
import Foundation

final class DashboardAPIService: APIService {
    
    // MARK: - Methods
    func requestDashboard() async throws -> AdminDashboardResponse {
        let spec = DashboardAPIs.dashboard.spec
        let headers = AdminHeader.baseHeaders
        
        let data = try await request(spec, headers: headers)
        
        guard let safeData = data.as(of: AdminDashboardResponse.self)
        else {
            throw HTTPError.decoding
        }
        debugPrint("대시보드 API 호출 결과: \(safeData)")
        
        return safeData
    }
    
    func requestDailyDashboard(
        from startDate: String,
        to endDate: String
    ) async throws -> AdminDailyDashboardResponse {
        let spec = DashboardAPIs.daily(from: startDate, to: endDate).spec
        let headers = AdminHeader.baseHeaders
        
        let data = try await request(spec, headers: headers)
        
        guard let safeData = data.as(of: AdminDailyDashboardResponse.self)
        else {
            throw HTTPError.decoding
        }
        debugPrint("일일현황 API 호출 결과: \(safeData)")
        
        return safeData
    }
    
}
