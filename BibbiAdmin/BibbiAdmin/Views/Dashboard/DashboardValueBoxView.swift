//
//  DashboardValueBoxView.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/25/24.
//

import SwiftUI

struct DashboardValueBoxView: View {
    
    // MARK: - Properties
    let value: DashboardValueResponse?
    let type: DashboardValueType
    
    // MARK: - Intializer
    init(
        _ value: DashboardValueResponse?,
        of type: DashboardValueType
    ) {
        self.type = type
        self.value = value
    }
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            if let value {
                HStack(spacing: 3) {
                    type.image
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
        .padding(.top, 12)
        .padding(.bottom, 14)
        .padding(.horizontal)
        .frame(height: 125)
        .frame(maxWidth: .infinity)
        .background(
            Color.gray800,
            in: RoundedRectangle(cornerRadius: 12)
        )
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
        .mock,
        of: .totalReaction
    )
    .previewLayout(.sizeThatFits)
}
