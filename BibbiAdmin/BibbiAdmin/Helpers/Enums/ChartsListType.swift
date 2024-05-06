//
//  ChartsDetailType.swift
//  BibbiAdmin
//
//  Created by 김건우 on 5/6/24.
//

import Foundation

enum ChartsListType {
    case member
    case post
    
    var header: String {
        switch self {
        case .member:
            return "사용자 수"
        case .post:
            return "게시물 수"
        }
    }
}
