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
        DashboardView()
            .background(Color.bibbiBlack)
    }
}

// MARK: - Preview
#Preview {
    ContentView()
        .environmentObject(DashboardViewModel())
}
