//
//  Dictionary+Ext.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/27/24.
//

import Foundation

extension Dictionary where Key == String, Value == Int {
    
    func toDailyValueResponse() -> [DailyValueResponse] {
        return self.map { key, value in
            DailyValueResponse(
                date: key.toDate(.dashYyyyMmDd) ?? Date(),
                count: value
            )
        }
    }
    
}
