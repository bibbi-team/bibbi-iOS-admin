//
//  APIServiceType.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/20/24.
//

import Foundation

protocol APIServiceType {
    func request(_ spec: APISpec, headers: [AdminHeader]?) async throws -> Data
}
