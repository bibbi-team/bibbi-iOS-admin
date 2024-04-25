//
//  APIService.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/20/24.
//

import Combine
import Foundation

class APIService: APIServiceType {
    
    func request(_ spec: APISpec, headers: [AdminHeader]? = nil) async throws -> Data {
        let url = URL(string: spec.url)!
        var request = URLRequest(url: url)
        request.headers = headers
        request.httpMethod = spec.method.rawValue
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode,
              200..<300 ~= statusCode
        else {
            throw HTTPError.statusCode
        }
        
        return data
    }
    
}
