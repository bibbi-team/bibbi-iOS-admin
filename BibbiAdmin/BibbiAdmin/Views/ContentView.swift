//
//  ContentView.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/20/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(BibbiString.dashboard)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
