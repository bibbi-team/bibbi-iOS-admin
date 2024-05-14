//
//  DailyMemberDatailView.swift
//  BibbiAdmin
//
//  Created by 김건우 on 5/6/24.
//

import ComposableArchitecture
import SwiftUI

struct ChartsListView: View {
    
    // MARK: - Store
    let store: StoreOf<ChartsList>
    
    // MARK: - Properties
    let type: ChartsListType
    
    // MARK: - Intializer
    init(
        store: StoreOf<ChartsList>,
        of type: ChartsListType
    ) {
        self.type = type
        self.store = store
    }
    
    // MARK: - Body
    var body: some View {
        chartsListView
    }
    
    // MARK: - Helpers
    @ViewBuilder
    private func formattedFluctuationText(_ value: Int) -> some View {
        let _value = abs(value)
        Text("\(value >= 0 ? "▲" : "▼")\(_value)")
    }
}

// MARK: - Extensions
extension ChartsListView {
    var chartsListView: some View {
        VStack {
            topBar
                .padding(.horizontal, 18)
                .padding(.top, 12)
                .padding(.bottom, 6)
            
            chartsValueForm
                .formStyle(.grouped)
        }
    }
    
    var topBar: some View {
        HStack {
            Text(type.title)
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(Color.bibbiWhite)
            
            Spacer()
            
            #if os(macOS)
            Button("닫기") {
                store.send(.dismiss)
            }
            #endif
        }
    }
    
    var chartsValueForm: some View {
        Form {
            if let values = store.values {
                Section {
                    ForEach(Array(zip(values.indices, values)), id: \.0) { (index, value) in
                        HStack {
                            Text(value.date.toFormatString(.yyyyMD))
                            Spacer()
                            Text("\(value.count)")
                                .fontWeight(.semibold)
                                .frame(width: 50)
                            
                            Group {
                                // 마지막 행(row)이라면
                                if index == values.count - 1 {
                                    Text("=0")
                                        .fontWeight(.semibold)
                                        .foregroundStyle(Color.secondary)
                                // 마지막 행이 아니라면
                                } else {
                                    let fluctuation = value.count - values[index + 1].count
                                    
                                    // 등락률이 0이라면
                                    Group {
                                        if fluctuation == 0 {
                                            Text("=0")
                                                .foregroundStyle(Color.secondary)
                                        } else {
                                            formattedFluctuationText(fluctuation)
                                                .foregroundStyle(fluctuation >= 0 ? Color.green : Color.red)
                                        }
                                    }
                                    .fontWeight(.semibold)
                                }
                            }
                            .frame(width: 50)
                            
                        }
                    }
                } header: {
                    HStack {
                        Text("날짜")
                        Spacer()
                        Group {
                            Text("\(type.header)")
                            Text("등락률")
                        }
                        .frame(width: 50)
                    }
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    ChartsListView(
        store: StoreOf<ChartsList>(initialState: ChartsList.State(values: DailyValueResponse.mock)) {
            ChartsList()
        },
        of: .member
    )
}
