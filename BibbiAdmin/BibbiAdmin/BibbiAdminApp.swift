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
    static let store = StoreOf<Dashboard>(initialState: Dashboard.State()) {
        Dashboard()
            ._printChanges()
    }
    
    // MARK: - Properties
    private var windowWidthSize: CGFloat = 714.0
    
    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            DashboardView(store: BibbiAdminApp.store)
                #if os(macOS)
                .frame(
                    minWidth: windowWidthSize,
                    maxWidth: windowWidthSize
                )
                #endif
                .background(Color.bibbiBlack)
        }
        #if os(macOS)
        .windowStyle(.hiddenTitleBar)
        .windowResizability(.contentSize)
        #endif
    }
}
