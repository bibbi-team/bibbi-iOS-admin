//
//  DashboardChartsView.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/27/24.
//

import ComposableArchitecture
import Charts
import SwiftUI

struct DashboardChartsView: View {
    
    // MARK: - Store
    @Bindable var store: StoreOf<DashboardCharts>
    
    // MARK: - Properties=
    let type: DashboardChartsType
    
    // MARK: - Intializer
    init(
        store: StoreOf<DashboardCharts>,
        of type: DashboardChartsType = .memberRegistration
    ) {
        self.type = type
        self.store = store
    }
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            HStack(spacing: 3) {
                Image(type.resource)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                Text(type.title)
                    .font(.system(size: 12))
                    .foregroundStyle(Color.gray200)
            }
            
            if let values = store.values {
                if !values.isEmpty {
                    Chart {
                        ForEach(values) { value in
                            AreaMark(
                                x: .value("Date", value.date, unit: .day),
                                y: .value("Count", value.count)
                            )
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [
                                        Color.mainYellow.opacity(0.7),
                                        Color.mainYellow.opacity(0.2),
                                        Color.mainYellow.opacity(0.1)
                                    ],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            
                            LineMark(
                                x: .value("Date", value.date, unit: .day),
                                y: .value("Count", value.count)
                            )
                            .symbol {
                                Circle()
                                    .fill(Color.mainYellow)
                                    .frame(width: 14, height: 14)
                            }
                            .lineStyle(.init(lineWidth: 0))
                            .foregroundStyle(Color.mainYellow)
                            
                            if let date = store.selectedDate {
                                RuleMark(
                                    x: .value("Selected", date, unit: .day)
                                )
                                .foregroundStyle(Color.gray.opacity(0.3))
                                .offset(yStart: -10)
                                .zIndex(-1)
                                .annotation(
                                    position: .top,
                                    spacing: 0,
                                    overflowResolution: .init(
                                        x: .fit(to: .chart),
                                        y: .disabled
                                    )
                                    
                                ) {
                                    if let value = store.selectedValue {
                                        VStack(alignment: .leading, spacing: 5) {
                                            Text(type.annotation)
                                                .font(.system(size: 12))
                                                .foregroundStyle(Color.gray200)
                                            Text("\(value.count)")
                                                .font(.system(size: 16, weight: .semibold))
                                                .foregroundStyle(Color.bibbiWhite)
                                        }
                                        .padding(10)
                                        .background(
                                            Color.gray600,
                                            in: RoundedRectangle(cornerRadius: 8)
                                        )
                                    } else {
                                        EmptyView()
                                    }
                                }
                            }
                        }
                        .interpolationMethod(.catmullRom)
                    }
                    .chartXAxis {
                        AxisMarks(preset: .aligned, values: .stride(by: .day)) { value in
                            if let date = value.as(Date.self) {
                                if date <= Date() {
                                    AxisValueLabel(date.toFormatString(.MDd))
                                        .font(.system(size: 18))
                                        .foregroundStyle(Color.gray200)
                                        .offset(x: 40, y: 16)
                                }
                                if date.isToday {
                                    AxisValueLabel("Today")
                                        .font(.system(size: 14))
                                        .foregroundStyle(Color.mainYellow)
                                        .offset(x: 40, y: 34)
                                }
                            }
                        }
                        
                    }
                    .chartYAxis {
                        AxisMarks(preset: .automatic, position: .leading, values: .automatic(minimumStride: 50)) { value in
                            if let count = value.as(Int.self) {
                                AxisValueLabel("\(count)")
                                    .font(.system(size: 14))
                                    .foregroundStyle(Color.gray300)
                            }
                            AxisGridLine(stroke: .init(dash: [5], dashPhase: 3))
                        }
                    }
                    .chartXSelection(value: $store.rawSelectedDate)
                    .chartXScale(range: .plotDimension(padding: 15))
                    .padding(.vertical, 40)
                    .padding(.horizontal)
                } else {
                    VStack(spacing: 5) {
                        Image(.lyingDownBibbi)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 80)
                        Text("차트를 불러올 수 없습니다.")
                            .font(.system(size: 14))
                            .foregroundStyle(Color.gray300)
                        Text("잠시 후 다시 시도하십시오.")
                            .font(.system(size: 12))
                            .foregroundStyle(Color.gray500)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
    }
    
    // MARK: - Helpers

}

// MARK: - Preview
#Preview {
    DashboardChartsView(
        store: StoreOf<DashboardCharts>(
            initialState:
                DashboardCharts.State(
                    values: AdminDailyDashboardResponse.mock
                        .dailyMemberValues
                )
        ) {
            DashboardCharts()
        },
        of: .memberRegistration
    )
}
