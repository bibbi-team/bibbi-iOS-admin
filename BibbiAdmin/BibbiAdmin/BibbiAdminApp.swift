//
//  BibbiAdminApp.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/20/24.
//

import ComposableArchitecture
import SwiftUI

@main
struct BibbiAdminApp: App {
    
    // MARK: - Store
    static let dashboardStore = StoreOf<Dashboard>(initialState: Dashboard.State()) {
        Dashboard()
            ._printChanges()
    }
    static let settingsStore = StoreOf<DashboardSettings>(initialState: DashboardSettings.State()) {
        DashboardSettings()
            ._printChanges()
    }
    
    // MARK: - Properties
    private var windowWidthSize: CGFloat = 768.0
    private var settingsWidthSize: CGFloat = 514.0
    
    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            DashboardView(store: BibbiAdminApp.dashboardStore)
                #if os(macOS)
                .frame(
                    minWidth: windowWidthSize,
                    maxWidth: windowWidthSize,
                    minHeight: windowWidthSize
                )
                #endif
                .background(Color.bibbiBlack)
                .preferredColorScheme(.dark)
        }
        #if os(macOS)
        .commands {
            CommandMenu("대시보드") {
                Button("새로고침") {
                    BibbiAdminApp.dashboardStore.send(.refresh)
                }
                .keyboardShortcut("r", modifiers: .command)
            }
        }
        .windowStyle(.hiddenTitleBar)
        .windowResizability(.contentSize)
        #endif
        
        #if os(macOS)
        Settings {
            SettingsView(store: BibbiAdminApp.settingsStore)
                .frame(
                    minWidth: settingsWidthSize,
                    maxWidth: settingsWidthSize
                )
        }
        .windowStyle(.hiddenTitleBar)
        .windowResizability(.contentSize)
        #endif
        
    }
}
