//
//  APISpec.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/20/24.
//

import Foundation

// MARK: - BaseAPI
protocol API {
    var spec: APISpec { get }
}

// MARK: - API Header
protocol APIHeader {
    var key: String { get }
    var value: String { get }
}

// MARK: - API Specification
struct APISpec {
    var method: HTTPMethod
    var url: String
}

// MARK: - HTTP Error
enum HTTPError: Error {
    case decoding
    case statusCode
    case unknown
    
    var localizedDescription: String {
        switch self {
        case .decoding:
            return "Decoding Error"
        case .statusCode:
            return "HTTP Status Code Error"
        default:
            return "Unknwon Error"
        }
    }
}

// MARK: - HTTP Method
enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}
