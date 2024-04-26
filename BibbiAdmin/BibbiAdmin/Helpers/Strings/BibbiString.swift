//
//  BibbiString.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/20/24.
//

import Foundation

typealias BibbiNetworkString = String.Network
typealias BibbiUserInterfaceString = String.UserInterface

extension String {
    enum Network { }
    enum UserInterface { }
}

extension BibbiNetworkString {
    static var appKey = "7c5aaa36-570e-491f-b18a-26a1a0b72959"
    static var xAuthToken = "eyJ0eXBlIjoiYWNjZXNzIiwiYWxnIjoiSFMyNTYiLCJ0eXAiOiJKV1QiLCJyZWdEYXRlIjoxNzE0MTMwNjkzMTgwfQ.eyJ1c2VySWQiOiLjhYjjhYLjhYfjhYLjhYjjhYfjhYLjhYciLCJleHAiOjE3MTQyMTcwOTN9.G-iCbnD37RgPMO9VoDh_nc18oqukUysUiq_yAhP6hqo"
}

extension BibbiUserInterfaceString {
    static var dashboard = "Dashboard"
    static var bibbi = "Bibbi"
}
