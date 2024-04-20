//
//  BibbiAdminApp.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/20/24.
//

import SwiftUI

@main
struct BibbiAdminApp: App {
    
    // MARK: - Properties
    @StateObject private var dashboardViewModel = DashboardViewModel()
    
    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dashboardViewModel)
        }
    }
}
