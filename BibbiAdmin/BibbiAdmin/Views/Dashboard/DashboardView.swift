//
//  DashboardView.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/20/24.
//

import ComposableArchitecture
import SwiftUI

struct DashboardView: View {
    
    // MARK: - Store
    let store: StoreOf<Dashboard>
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 0) {
            DashboardTopBarView()
                .padding(.top)
            
            ScrollView(.vertical, showsIndicators: false) {
                if store.isLoading {
                    ProgressView()
                } else {
                    Text(store.adminDashboardResponse.debugDescription)
                        .font(.title)
                        .foregroundStyle(Color.bibbiWhite)
                }
                
                Button("Fetch") {
                    store.send(.fetchDashboardResponse)
                }
                .buttonStyle(.borderedProminent)
            }
            .onAppear {
                store.send(.fetchDashboardResponse)
            }
        }
    }
}

// MARK: - Preview
#Preview {
    DashboardView(store:
        .init(initialState: Dashboard.State()) {
            Dashboard()
        }
    )
}
