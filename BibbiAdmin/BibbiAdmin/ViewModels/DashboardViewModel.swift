//
//  DashboardViewModel.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/20/24.
//

import Combine
import Foundation
import SwiftUI

final class DashboardViewModel: ObservableObject, ViewModelType {
    
    // MARK: - Properties
    var cancellable: Set<AnyCancellable> = Set<AnyCancellable>()
    
    let dashboardApiService: DashboardAPIService
    
    @Published var dashboardResponse: AdminDashboardResponse?
    @Published var dailyDashboardResponse: AdminDailyDashboardResponse?
    
    // MARK: - Computed Properties
    
    // MARK: - Intializer
    init(dashboardApiService apiService: DashboardAPIService = DashboardAPIService()){
        self.dashboardApiService = apiService
    }
    
    // MARK: - Methods
    func fetchDashboardResponse() {
        return dashboardApiService.requestDashboard()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case let .failure(error):
                    debugPrint("RequestDashboard: " + error.localizedDescription)
                case .finished:
                    debugPrint("대시보드 API 호출 완료")

                }
            } receiveValue: { response in
                self.dashboardResponse = response
            }
            .store(in: &cancellable)

    }
    
    func fetchDailyDashboardResponse(from startDate: Date, to endDate: Date) {
        let endDate = endDate.toFormatString(.dashYyyyMmDd)
        let startDate = startDate.toFormatString(.dashYyyyMmDd)
        
        return dashboardApiService.requestDailyDashboard(from: startDate, to: endDate)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case let .failure(error):
                    debugPrint("RequestDailyDashboard: " + error.localizedDescription)
                case .finished:
                    debugPrint("일일 현황 API 호출 완료")

                }
            } receiveValue: { response in
                self.dailyDashboardResponse = response
            }
            .store(in: &cancellable)
    }
    
}
