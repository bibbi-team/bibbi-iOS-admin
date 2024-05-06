//
//  Array+Extension.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/29/24.
//

import Foundation

extension Array {
    
    func last(_ k: Int) -> Self {
        self.suffix(k)
    }
    
}
