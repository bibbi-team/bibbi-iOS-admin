//
//  DevelopersModel.swift
//  BibbiAdmin
//
//  Created by 김건우 on 5/6/24.
//

import SwiftUI

struct Developers {
    var name: String
    var position: Position
}

extension Developers {
    enum `Position`: String {
        case ios = "iOS"
        case backend = "Server"
        case designer = "Designer"
        
        var systemName: String {
            switch self {
            case .ios:
                return "heart.fill"
            case .backend:
                return "server.rack"
            case .designer:
                return "camera.macro.circle.fill"
            }
        }
    }
}

extension Developers: Identifiable {
    var id: UUID { UUID() }
}

// MARK: - Model
extension Developers {
    static let model = [
        Self(
            name: "김소월",
            position: .ios
        ),
        Self(
            name: "김도현",
            position: .ios
        ),
        Self(
            name: "마경미",
            position: .ios
        ),
        Self(
            name: "하유나",
            position: .designer
        ),
        Self(
            name: "이일여",
            position: .designer
        ),
        Self(
            name: "송영민",
            position: .backend
        ),
        Self(
            name: "권순찬",
            position: .backend
        ),
        Self(
            name: "임지수",
            position: .backend
        )
    ]
}
