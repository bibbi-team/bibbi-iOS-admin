//
//  Publisher+Ext.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/20/24.
//

import Combine
import Foundation

extension Publisher {
    
    func mapError<E>(
        of type: E.Type,
        replaceIfCastingFail replaceError: E
    ) -> Publishers.MapError<Self, E> where E: Error {
        mapError { error in
            if let specificError = error as? E {
                return specificError
            } else {
                return replaceError
            }
        }
    }
    
}
