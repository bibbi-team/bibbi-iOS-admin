//
//  URLRequest+Ext.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/20/24.
//

import Foundation

struct AssociatedKeys {
    static var headersAssocidatedKey = "headersAssociatedKey"
}

extension URLRequest {
    var underlyingHeaders: [APIHeader]? {
        get {
            objc_getAssociatedObject(
                self,
                &AssociatedKeys.headersAssocidatedKey
            ) as! [APIHeader]?
        }
        set {
            objc_setAssociatedObject(
                self,
                &AssociatedKeys.headersAssocidatedKey,
                newValue,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }
    
    var headers: [APIHeader]? {
        get { underlyingHeaders }
        set {
            self.setHeaders(newValue)
            underlyingHeaders = newValue
        }
    }
}

extension URLRequest {
    mutating func setHeaders(_ headers: [APIHeader]?) {
        if let headers = headers {
            self.setValues(headers)
        }
    }
    
    mutating func setValues(_ headers: [APIHeader]) {
        for header in headers {
            self.setValue(header.value, forHTTPHeaderField: header.key)
        }
    }
}
