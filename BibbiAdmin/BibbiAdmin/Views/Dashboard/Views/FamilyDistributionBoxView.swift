//
//  FamilyDistributionBoxView.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/26/24.
//

import ComposableArchitecture
import SwiftUI

struct FamilyDistributionBoxView: View {
    
    // MARK: - Store
    @Bindable var store: StoreOf<DashboardValue>
    
    // MARK: - Properties
    let gridItem: [GridItem] = [
        .init(.flexible()),
        .init(.flexible()),
        .init(.flexible()),
        .init(.flexible())
    ]
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            if let distributions = store.value?.familyMemberDistribution {
                HStack(spacing: 3) {
                    Image(.smile)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                    Text("가족 인원 분포")
                        .font(.system(size: 12))
                        .foregroundStyle(Color.gray200)
                }
                
                GeometryReader { geometry in
                    let size = geometry.frame(in: .global).size
                    
                    let width: CGFloat = 75
                    let spacing = size.width - (width * 2) - 8
                    VStack {
                        Spacer() // GeometryReader는 외부에서 Spacer()가 안됨
                        
                        LazyHGrid(rows: gridItem, spacing: spacing) {
                            ForEach(distributions) { distribution in
                                HStack {
                                    Circle()
                                        .frame(width: 4, height: 4)
                                        .foregroundStyle(Color.mainYellow)
                                    
                                    Text("\(distribution.count)명")
                                        .font(.system(size: 12, weight: .semibold))
                                        .foregroundStyle(Color.gray200)
                                    
                                    Spacer()
                                    
                                    formattedDistributionPercentText(distribution.percent)
                                        .font(.system(size: 10))
                                        .foregroundStyle(Color.gray400)
                                }
                                .frame(width: width, height: 17, alignment: .leading)
                            }
                        }
                        .frame(height: 80)
                        .frame(maxWidth: .infinity)
                    }
                }
            }
        }
    }
    
    // MARK: - Helpers
    
    @ViewBuilder
    private func formattedDistributionPercentText(_ value: Double) -> some View {
        let _str = String(format: "%.1f", value)
        Text("\(_str)%")
    }
    
}

// MARK: - Preview
#Preview {
    FamilyDistributionBoxView(
        store: StoreOf<DashboardValue>(
            initialState: DashboardValue.State(
                value: .mock
            )
        ) {
            DashboardValue()
        }
    )
    .roundedBoxStyle(height: 139)
}
