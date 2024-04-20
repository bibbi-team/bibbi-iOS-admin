//
//  APIService.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/20/24.
//

import Combine
import Foundation

class APIService: APIServiceType {
    
    func request(_ spec: APISpec, headers: [AdminHeader]? = nil) -> AnyPublisher<Data, Error> {
        let url = URL(string: spec.url)!
        var request = URLRequest(url: url)
        request.headers = headers
        request.httpMethod = spec.method.rawValue
        
        return Just(request)
            .flatMap { request in
                URLSession.shared.dataTaskPublisher(for: request)
                    .tryMap { data, response in
                        guard let statusCode = (response as? HTTPURLResponse)?.statusCode,
                              200..<300 ~= statusCode else {
                            throw HTTPError.statusCodeError
                        }
                        return data
                    }
            }
            .eraseToAnyPublisher()
    }
    
}
