//
//  API.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/20/24.
//

import Foundation

typealias AdminHeader = AdminAPI.Header

enum AdminAPI {
    private static let _config: APIConfigType = APIConfig()
    static let hostApi: String = _config.hostApi
    
    enum Header: APIHeader {
        case xAppKey
        case xAuthToken(token: String)
        case contentJson
        
        var key: String {
            switch self {
            case .xAppKey:
                return "X-APP-KEY"
            case .xAuthToken:
                return "X-AUTH-TOKEN"
            case .contentJson:
                return "Content-Type"
            }
        }
        
        var value: String {
            switch self {
            case .xAppKey:
                return "\(BibbiNetworkString.appKey)"
            case let .xAuthToken(token):
                return "\(token)"
            case .contentJson:
                return "application/json"
            }
        }
        
        static var baseHeaders: [Self] {
            [.contentJson, .xAppKey, .xAuthToken(token: BibbiNetworkString.xAuthToken)]
        }
    }
}
