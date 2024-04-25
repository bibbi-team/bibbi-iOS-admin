//
//  DashboardValueType.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/25/24.
//

import SwiftUI

enum DashboardValueType {
    case totalMember
    case totalFamily
    case totalPost
    case totalComment
    case totalReaction
    
    var title: String {
        switch self {
        case .totalMember:
            return "전체 가입자 수"
        case .totalFamily:
            return "전체 가족 수"
        case .totalPost:
            return "전체 게시물 수"
        case .totalComment:
            return "전체 댓글 수"
        case .totalReaction:
            return "전체 이모지 수"
        }
    }
    
    var image: Image {
        switch self {
        case .totalMember:
            return Image(.firecracker)
        case .totalFamily:
            return Image(.fire)
        case .totalPost:
            return Image(.heart)
        case .totalComment:
            return Image(.message)
        case .totalReaction:
            return Image(.smile2)
        }
    }
}
