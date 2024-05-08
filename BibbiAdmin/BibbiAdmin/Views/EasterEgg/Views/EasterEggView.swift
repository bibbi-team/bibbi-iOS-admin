//
//  EasterEggView.swift
//  BibbiAdmin
//
//  Created by 김건우 on 5/7/24.
//

import ComposableArchitecture
import SwiftUI

struct EasterEggView: View {
    
    // MARK: - Store
    let store: StoreOf<EasterEgg>
    
    // MARK: - Body
    var body: some View {
        VStack {
            if let poem = store.poem {
                HStack {
                    Text("\(poem.title)")
                        .font(.system(size: 16, weight: .bold))
                    
                    Spacer()
                    
                    #if os(macOS)
                    Button("닫기") {
                        store.send(.dismiss)
                    }
                    #endif
                }
                .padding(.horizontal, 18)
                .padding(.top, 12)
                .padding(.bottom, 6)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 30) {
                        VStack(alignment: .leading, spacing: 15) {
                            ForEach(poem.contents, id: \.self) { content in
                                Text(content)
                                    .font(.system(size: 16))
                            }
                        }
                        
                        Text("- \(poem.author) -")
                            .font(.system(size: 18, weight: .semibold))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .safeAreaPadding()
                }
            }
        }
    }
}

// MARK: - Extensions
extension EasterEggView {
    
}

// MARK: - Preview
#Preview {
    EasterEggView(
        store: StoreOf<EasterEgg>(initialState: EasterEgg.State(poem: Poem.models.randomElement())) {
            EasterEgg()
        }
    )
}
