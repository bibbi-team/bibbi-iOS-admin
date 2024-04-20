//
//  ContentView.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/20/24.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    @EnvironmentObject var viewModel: DashboardViewModel
    
    // MARK: - Body
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(BibbiUserInterfaceString.dashboard)
        }
        .padding()
        .onAppear(perform: {
            viewModel.fetchDashboardResponse()
            
            let startDate = Date().addingTimeInterval(-86400 * 7)
            let endDate = Date()
            viewModel.fetchDailyDashboardResponse(from: startDate, to: endDate)
        })
    }
}

#Preview {
    ContentView()
        .environmentObject(DashboardViewModel())
}
