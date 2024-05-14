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
    static var xAuthToken = "eyJ0eXAiOiJKV1QiLCJyZWdEYXRlIjoxNzE1NjExNTU5ODQ1LCJ0eXBlIjoiYWNjZXNzIiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWQiOiLjhYjjhYLjhYfjhYjjhYIiLCJleHAiOjE3MTU2OTc5NTl9.ylUktok3of-FahKkXvvebKVJE4X4EP4HLyrOhVrA5_4"
}

extension BibbiUserInterfaceString {
    static var dashboard = "Dashboard"
    static var bibbi = "Bibbi"
}
