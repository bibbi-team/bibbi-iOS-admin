//
//  Bundle+Ext.swift
//  BibbiAdmin
//
//  Created by 김건우 on 5/2/24.
//

import Foundation

extension Bundle {
    var version: String {
        return (infoDictionary?["CFBundleShortVersionString"] as? String) ?? "-"
    }
    var buildNumber: String {
        return (infoDictionary?["CFBundleVersion"] as? String) ?? "0"
    }
}
