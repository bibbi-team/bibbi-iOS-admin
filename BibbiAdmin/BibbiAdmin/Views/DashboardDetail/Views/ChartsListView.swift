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
        VStack {
            HStack {
                Spacer()
                
                Button("닫기") {
                    store.send(.dismiss)
                }
            }
            .padding(.horizontal)
            .padding(.top, 12)
            .padding(.bottom, 6)
            
            Form {
                if let values = store.values {
                    Section {
                        ForEach(values) { value in
                            HStack {
                                Text(value.date.toFormatString(.dashYyyyMmDd))
                                Spacer()
                                Text("\(value.count)")
                            }
                        }
                    } header: {
                        HStack {
                            Text("날짜")
                            Spacer()
                            Text("\(type.header)")
                        }
                    }
                }
            }
            .formStyle(.grouped)
        }
    }
}

#Preview {
    ChartsListView(
        store: StoreOf<ChartsList>(initialState: ChartsList.State(values: DailyValueResponse.mock)) {
            ChartsList()
        },
        of: .member
    )
}
