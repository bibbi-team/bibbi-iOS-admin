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
    
    var title: String {
        switch self {
        case .member:
            return "일일 가입자 수 현황"
        case .post:
            return "일일 게시물 수 현황"
        }
    }
    
    var header: String {
        switch self {
        case .member:
            return "가입자 수"
        case .post:
            return "게시물 수"
        }
    }
}
