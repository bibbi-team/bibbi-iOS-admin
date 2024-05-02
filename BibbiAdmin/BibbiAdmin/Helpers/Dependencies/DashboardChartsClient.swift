//
//  DashboardChartsClient.swift
//  BibbiAdmin
//
//  Created by 김건우 on 5/2/24.
//

import ComposableArchitecture
import Foundation

extension DashboardCharts {
    
    private func endOfDate(_ date: Date) -> Date {
        calendar.date(byAdding: .day, value: 1, to: date)!
    }
    
    private func checkVaildSelection(on rawSelctedDate: Date?, values: [DailyValueResponse]?) -> Date? {
        // 선택한 날짜(X축)가 오늘~다음 날에 포함되는 Values가 있는지 확인
        if let date = rawSelctedDate {
            return values?.first(where: { response in
                let endOfDate = self.endOfDate(response.date)

                return (response.date...endOfDate).contains(date)
            })?.date
        }
    
        return nil
    }
    
    private func checkVaildValue(on selectedDate: Date?, values: [DailyValueResponse]?) -> DailyValueResponse? {
        guard let selectedDate = selectedDate, let values = values,
              let value = values.first(where: { value in
            value.date.isEqual(with: selectedDate)
        }) else {
            return nil
        }

        return value
    }
    
}


@DependencyClient
struct DashboardChartsClient {
    var checkVaildSelection: (_ on: Date?, _ values: [DailyValueResponse]?) -> Date?
    var checkVaildValue: (_ on: Date?, _ values: [DailyValueResponse]?) -> DailyValueResponse?
}

extension DashboardChartsClient: DependencyKey {
    static let liveValue = Self(
        checkVaildSelection: { rawSelectedDate, values in
            // 선택한 날짜(X축)가 오늘~다음 날에 포함되는 Values가 있는지 확인
            if let date = rawSelectedDate {
                return values?.first(where: { response in
                    let endOfDate = response.date.endOfDate

                    return (response.date...endOfDate).contains(date)
                })?.date
            }
        
            return nil
        },
        checkVaildValue: { selectedDate, values in
            guard let selectedDate = selectedDate, let values = values,
                  let value = values.first(where: { value in
                value.date.isEqual(with: selectedDate)
            }) else {
                return nil
            }

            return value
        }
    )
}

extension DependencyValues {
    var charts: DashboardChartsClient {
        get { self[DashboardChartsClient.self] }
        set { self[DashboardChartsClient.self] = newValue }
    }
}
