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
    func requestDashboard() -> AnyPublisher<AdminDashboardResponse, HTTPError> {
        let spec = DashboardAPIs.dashboard.spec
        let headers = AdminHeader.baseHeaders
        
        return request(spec, headers: headers)
            .tryMap { data in
                let decoder = JSONDecoder()
                guard let response = try? decoder.decode(AdminDashboardResponse.self, from: data) else {
                    throw HTTPError.decodingError
                }
                return response
            }
            .handleEvents(receiveOutput: { response in
                print("대시보드 API 호출 결과: \(response)")
            })
            .mapError(
                of: HTTPError.self,
                replaceIfCastingFail: HTTPError.unknown
            )
            .eraseToAnyPublisher()
    }
    
    func requestDailyDashboard(from startDate: String, to endDate: String) -> AnyPublisher<AdminDailyDashboardResponse, HTTPError> {
        let spec = DashboardAPIs.daily(from: startDate, to: endDate).spec
        let headers = AdminHeader.baseHeaders
        
        return request(spec, headers: headers)
            .tryMap { data in
                let decoder = JSONDecoder()
                guard let response = try? decoder.decode(AdminDailyDashboardResponse.self, from: data) else {
                    throw HTTPError.decodingError
                }
                return response
            }
            .handleEvents(receiveOutput: { response in
                print("일별 현황 API 호출 결과: \(response)")
            })
            .mapError(
                of: HTTPError.self,
                replaceIfCastingFail: HTTPError.unknown
            )
            .eraseToAnyPublisher()
    }
    
}
