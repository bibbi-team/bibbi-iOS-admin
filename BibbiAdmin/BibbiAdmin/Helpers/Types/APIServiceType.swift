//
//  APIServiceType.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/20/24.
//

import Combine
import Foundation

protocol APIServiceType {
    func request(_ spec: APISpec, headers: [AdminHeader]?) -> AnyPublisher<Data, Error>
}
