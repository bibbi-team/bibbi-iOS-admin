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
    static var xAuthToken = "eyJyZWdEYXRlIjoxNzE0MDI5NzkyMjcwLCJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsInR5cGUiOiJhY2Nlc3MifQ.eyJ1c2VySWQiOiJmZWZlZnFlZnFlZnFmIiwiZXhwIjoxNzE0MTE2MTkyfQ.V5Nl5Yfn7P44QiUEDCFrSfYILt4sCOIdfvlHeAwCuV4"
}

extension BibbiUserInterfaceString {
    static var dashboard = "Dashboard"
    static var bibbi = "Bibbi"
}
