//
//  Decodable+Ext.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/25/24.
//

import Foundation

extension Data {
    func `as`<T: Decodable>(of type: T.Type) -> T? {
        let decoder = JSONDecoder()
        return try? decoder.decode(type, from: self)
    }
}
