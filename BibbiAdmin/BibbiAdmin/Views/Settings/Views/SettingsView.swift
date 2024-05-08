//
//  SettingsView.swift
//  BibbiAdmin
//
//  Created by 김건우 on 5/2/24.
//

import ComposableArchitecture
import SwiftUI

struct SettingsView: View {
    
    // MARK: - Store
    let store: StoreOf<DashboardSettings>
    
    // MARK: - Body
    var body: some View {
        settings
    }
    
    // MARK: - Helpers
    @ViewBuilder
    func labelRow(
        title: String,
        subTitle: String,
        tintColor: Color = .primary,
        systemName: String?
    ) -> some View {
        HStack {
            if let name = systemName {
                Image(systemName: name)
                    .resizable()
                    .frame(width: 15, height: 15)
                    .padding(5)
                    .background(
                        tintColor,
                        in: RoundedRectangle(cornerRadius: 8)
                    )
                    #if os(iOS)
                    .foregroundStyle(Color.white)
                    #endif
            }
            Text(title)
            Spacer()
            Text(subTitle)
                .foregroundStyle(Color.secondary)
        }
        #if os(macOS)
        .padding(.vertical, 0)
        .padding(.horizontal, 3)
        #endif
    }
}

// MARK: - Extensions
extension SettingsView {
    var settings: some View {
        NavigationStack {
            Form {
                appInfoSection
                
                developersSection
            }
            .formStyle(.grouped)
            .navigationTitle("설정")
        }
    }
    
    var appInfoSection: some View {
        Section {
            labelRow(
                title: "버전",
                subTitle: "\(Bundle.main.version) (Beta 1)",
                tintColor: Color.red,
                systemName: "leaf.circle.fill"
            )
            labelRow(
                title: "빌드",
                subTitle: "\(Bundle.main.buildNumber)",
                tintColor: Color.blue,
                systemName: "sun.max.fill"
            )
        } header: {
            Text("앱 정보")
        }
    }
    
    var developersSection: some View {
        Section {
            ForEach(Developer.models) { developer in
                labelRow(
                    title: developer.name,
                    subTitle: developer.position.rawValue,
                    tintColor: Color.random,
                    systemName: developer.position.systemName
                )
            }
        } header: {
            Text("개발자")
        }
    }
}

// MARK: - Preview
#Preview {
    SettingsView(
        store: StoreOf<DashboardSettings>(initialState: DashboardSettings.State()) {
            DashboardSettings()
        }
    )
}
