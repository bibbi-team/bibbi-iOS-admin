//
//  DashboardValueBoxView.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/25/24.
//

import ComposableArchitecture
import SwiftUI

struct DashboardValueBoxView: View {
    
    // MARK: - Store
    @Bindable var store: StoreOf<DashboardValue>
    
    // MARK: - Properties
    let type: DashboardValueType
    
    // MARK: - Computed Properties
    var value: DashboardValueResponse? {
        switch type {
        case .totalMember:
            return store.value?.totalMember
        case .totalFamily:
            return store.value?.totalFamily
        case .totalPost:
            return store.value?.totalPost
        case .totalComment:
            return store.value?.totalComment
        case .totalReaction:
            return store.value?.totalReaction
        }
    }
    
    // MARK: - Intializer
    init(
        store: StoreOf<DashboardValue>,
        of type: DashboardValueType
    ) {
        self.type = type
        self.store = store
    }
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            if let value = value {
                HStack(spacing: 3) {
                    Image(type.resource)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                    Text("\(type.title)")
                        .font(.system(size: 12))
                        .foregroundStyle(Color.gray200)
                }
                
                Text("\(value.count)")
                    .font(.system(size: 36, weight: .semibold))
                    .foregroundStyle(Color.bibbiWhite)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    HStack(spacing: 2) {
                        formattedPercentBetweenYesturdayText(value.percentBetweenYesterday)
                            .font(.system(size: 10, weight: .bold))
                            .foregroundStyle(value.percentBetweenYesterday >= 0.0 ? Color.graphicGreen : Color.warningRed)
                        Text("Yesturday")
                            .font(.system(size: 9))
                            .foregroundStyle(Color.gray400)
                    }
                }
            }
        }
    }
    
    // MARK: - Helpers
    
    @ViewBuilder
    private func formattedPercentBetweenYesturdayText(_ value: Double) -> some View {
        let _str = String(format: "%.1f", value)
        Text("\(value >= 0.0 ? "▲" : "▼")\(_str)%")
    }
}

// MARK: - Preview
#Preview {
    DashboardValueBoxView(
        store: StoreOf<DashboardValue>(
            initialState: DashboardValue.State(
                value: .mock
            )) {
                DashboardValue()
            },
        of: .totalReaction
    )
    .roundedBoxStyle(height: 139)
}
