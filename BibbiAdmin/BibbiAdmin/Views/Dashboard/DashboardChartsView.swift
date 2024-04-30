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
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            HStack(spacing: 3) {
                Image(.people)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                Text("일별 가입자 수 추이")
                    .font(.system(size: 12))
                    .foregroundStyle(Color.gray200)
            }
            
            if let values = store.dailyMemberValues {
                if !values.isEmpty {
                    Chart {
                        ForEach(values) { value in
                            AreaMark(
                                x: .value("Date", value.date),
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
                            .interpolationMethod(.catmullRom)
                            
                            LineMark(
                                x: .value("Date", value.date),
                                y: .value("Count", value.count)
                            )
                            .symbol {
                                Circle()
                                    .fill(Color.mainYellow)
                                    .frame(width: 16, height: 16)
                            }
                            .lineStyle(.init(lineWidth: 0))
                            .interpolationMethod(.catmullRom)
                            .foregroundStyle(Color.mainYellow)
                        }
                    }
                    .chartXAxis {
                        AxisMarks(preset: .aligned, values: .stride(by: .day)) { value in
                            if let date = value.as(Date.self) {
                                AxisValueLabel(date.toFormatString(.MDd))
                                    .font(.system(size: 18))
                                    .foregroundStyle(Color.gray200)
                                    .offset(y: 16)
                                if date.isToday {
                                    AxisValueLabel("Today")
                                        .font(.system(size: 14))
                                        .foregroundStyle(Color.mainYellow)
                                        .offset(y: 34)
                                }
                            }
                        }
                        
                    }
                    .chartYAxis {
                        AxisMarks(preset: .automatic, position: .leading, values: .automatic(minimumStride: 50)) { value in
                            if let count = value.as(Int.self) {
                                AxisValueLabel("\(count)")
                                    .font(.system(size: 16))
                                    .foregroundStyle(Color.gray300)
                            }
                            AxisGridLine(stroke: .init(dash: [5], dashPhase: 3))
                        }
                    }
                    .chartXSelection(value: $store.selectedDate)
                    .chartXScale(range: .plotDimension(padding: 15))
                    .padding(.bottom, 40)
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
}

// MARK: - Preview
#Preview {
    DashboardChartsView(
        store: StoreOf<DashboardCharts>(
            initialState:
                DashboardCharts.State(
                    response: .mock
                )
        ) {
            DashboardCharts()
        }
    )
}
