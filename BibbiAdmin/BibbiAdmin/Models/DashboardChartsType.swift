//
//  DashboardChartsType.swift
//  BibbiAdmin
//
//  Created by 김건우 on 5/2/24.
//

import Foundation

enum DashboardChartsType {
    case memberRegistration
    case postCreation
    
    var title: String {
        switch self {
        case .memberRegistration:
            return "일별 가입자 수 추이"
        case .postCreation:
            return "일별 게시물 수 추이"
        }
    }
    
    var annotation: String {
        switch self {
        case .memberRegistration:
            return "가입자 수"
        case .postCreation:
            return "게시물 수"
        }
    }
    
    var resource: String {
        switch self {
        case .memberRegistration:
            return "people"
        case .postCreation:
            return "camera"
        }
    }
}
