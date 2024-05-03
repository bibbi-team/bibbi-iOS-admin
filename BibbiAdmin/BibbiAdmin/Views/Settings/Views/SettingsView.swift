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
    
    // MARK: - Properties
    let kimsowolGitHubURL = URL(string: "https://github.com/rlarjsdn3")
    let kimdohyunGitHubURL = URL(string: "https://github.com/Do-hyun-Kim")
    let makyungmiGitHubURL = URL(string: "https://github.com/akrudal")
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    RowLabel(
                        "버전",
                        text: "\(Bundle.main.version)",
                        tintColor: Color.red,
                        systemName: "leaf.circle.fill"
                    )
                    RowLabel(
                        "빌드",
                        text: "\(Bundle.main.buildNumber)",
                        tintColor: Color.blue,
                        systemName: "sun.max.fill"
                    )
                } header: {
                    Text("앱 정보")
                }
                
                Section {
                    RowLink(
                        "김소월",
                        url: kimsowolGitHubURL!,
                        tintColor: Color.green
                    )
                    RowLink(
                        "김도현",
                        url: kimdohyunGitHubURL!,
                        tintColor: Color.orange
                    )
                    RowLink(
                        "마경미",
                        url: makyungmiGitHubURL!,
                        tintColor: Color.red
                    )
                } header: {
                    Text("개발자")
                }
            }
            .formStyle(.grouped)
            .navigationTitle("설정")
        }
    }
    
    // MARK: - ViewBuilders
    @ViewBuilder
    func RowLabel(
        _ title: String? = nil,
        text: String? = nil,
        tintColor: Color = .primary,
        systemName: String?
    ) -> some View {
        HStack {
            if let name = systemName {
                Image(systemName: name)
                    .padding(5)
                    .background(
                        tintColor,
                        in: RoundedRectangle(cornerRadius: 8)
                    )
                    #if os(iOS)
                    .foregroundStyle(Color.white)
                    #endif
            }
            Text(title ?? "")
            Spacer()
            Text(text ?? "")
                .foregroundStyle(Color.secondary)
        }
    }
    
    @ViewBuilder
    func RowLink(
        _ title: String? = nil,
        url: URL,
        tintColor: Color
    ) -> some View {
        HStack {
            RowLabel(
                title,
                tintColor: tintColor,
                systemName: "heart.fill"
            )
            Spacer()
            Link(
                "GitHub",
                destination: url)
        }
    }
}

#Preview {
    SettingsView(
        store: StoreOf<DashboardSettings>(initialState: DashboardSettings.State()) {
            DashboardSettings()
        }
    )
}
