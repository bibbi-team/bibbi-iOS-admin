//
//  Date+Ext.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/20/24.
//

import Foundation

extension Date {
    enum CustomFormatStyle {
        case dashYyyyMmDd
        
        var string: String {
            switch self {
            case .dashYyyyMmDd:
                return "yyyy-MM-dd"
            }
        }
    }
}

extension Date {
    func toFormatString(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.calendar = .autoupdatingCurrent
        formatter.timeZone = .autoupdatingCurrent
        return formatter.string(from: self)
    }
    
    func toFormatString(_ type: Date.CustomFormatStyle) -> String {
        return toFormatString(type.string)
    }
}
