//
//  DashboardView.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/20/24.
//

import SwiftUI

struct DashboardView: View {
    
    // MARK: - Properties
    @EnvironmentObject var viewModel: DashboardViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            DashboardTopBarView()
                .padding(.top)
            
            ScrollView(.vertical, showsIndicators: false) {
                
            }
        }
    }
}

// MARK: - Preview
#Preview {
    DashboardView()
        .environmentObject(DashboardViewModel())
}
