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
    static var xAuthToken = "eyJ0eXBlIjoiYWNjZXNzIiwiYWxnIjoiSFMyNTYiLCJ0eXAiOiJKV1QiLCJyZWdEYXRlIjoxNzE0OTcyNDk3NjcyfQ.eyJ1c2VySWQiOiLjhYfjhYLjhYgiLCJleHAiOjE3MTUwNTg4OTd9.hUKtNujBXyO_ehseL64PwS-K_2WbDryAYMYfCCcWyUo"
}

extension BibbiUserInterfaceString {
    static var dashboard = "Dashboard"
    static var bibbi = "Bibbi"
}
