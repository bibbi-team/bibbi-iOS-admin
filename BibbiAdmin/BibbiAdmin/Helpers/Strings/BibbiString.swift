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
    static var xAuthToken = "eyJyZWdEYXRlIjoxNzE1MDgxOTg0NjQ4LCJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsInR5cGUiOiJhY2Nlc3MifQ.eyJ1c2VySWQiOiJkcXdkcXdkcXdkcXciLCJleHAiOjE3MTUxNjgzODR9.Yo2C6Ol4iUNo8c6li41X-jn9P9Nsv6HckkYxkWwcT4Q"
}

extension BibbiUserInterfaceString {
    static var dashboard = "Dashboard"
    static var bibbi = "Bibbi"
}
