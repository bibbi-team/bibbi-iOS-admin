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
        boxView
    }
    
    // MARK: - Helpers
    @ViewBuilder
    private func formattedPercentBetweenYesturdayText(_ value: Double) -> some View {
        let _value = abs(value)
        let _str = String(format: "%.1f", _value)
        Text("\(value >= 0.0 ? "▲" : "▼")\(_str)%")
    }
}

extension DashboardValueBoxView {
    var boxView: some View {
        VStack(alignment: .leading, spacing: 3) {
            if let value = store.state.value(of: type) {
                title
                
                count(value.count)
                
                Spacer()
                
                percentBetweenYesturday(value.percentBetweenYesterday)
            }
        }
    }
    
    var title: some View {
        HStack(spacing: 3) {
            Image(type.resource)
                .resizable()
                .scaledToFit()
                .frame(width: 15, height: 15)
            Text("\(type.title)")
                .font(.system(size: 12))
                .foregroundStyle(Color.gray200)
        }
    }
    
    func count(_ count: Int) -> some View {
        Text("\(count)")
            .font(.system(size: 36, weight: .semibold))
            .foregroundStyle(Color.bibbiWhite)
    }
    
    func percentBetweenYesturday(_ value: Double) -> some View {
        HStack {
            Spacer()
            
            HStack(spacing: 2) {
                Group {
                    if value == 0.0 {
                        Text("=0")
                            .foregroundStyle(Color.secondary)
                    } else {
                        formattedPercentBetweenYesturdayText(value)
                            .foregroundStyle(value >= 0.0 ? Color.graphicGreen : Color.warningRed)
                    }
                }
                .font(.system(size: 10, weight: .bold))
                
                Text("Yesturday")
                    .font(.system(size: 9))
                    .foregroundStyle(Color.gray400)
            }
        }
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
