//
//  Array+Extension.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/29/24.
//

import Foundation

extension Array {
    
    func last(_ k: Int) -> Self {
        guard count != 0 else { return [] }
        
        var last: [Element] = []
        
        let remainingCount = count - k
        var lastCount = remainingCount >= 0 ? remainingCount : count
        
        let endIndex = count - 1
        let startIndex = lastCount
        
        for index in (startIndex...endIndex) {
            last.append(self[index])
        }
        return last
    }
    
}
