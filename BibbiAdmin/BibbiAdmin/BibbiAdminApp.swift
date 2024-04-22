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
    
    private var windowWidthSize: CGFloat = 714.0
    
    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dashboardViewModel)
                #if os(macOS)
                .frame(
                    minWidth: windowWidthSize,
                    maxWidth: windowWidthSize
                )
                #endif
        }
        #if os(macOS)
        .windowStyle(.hiddenTitleBar)
        .windowResizability(.contentSize)
        #endif
    }
}
