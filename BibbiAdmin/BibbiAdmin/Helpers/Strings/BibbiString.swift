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
    static var xAuthToken = "eyJ0eXAiOiJKV1QiLCJyZWdEYXRlIjoxNzEzNjEyOTcwNzYyLCJ0eXBlIjoiYWNjZXNzIiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWQiOiIwMUhLTVE1N1ZDREcxV1Y0U0ZTODVZUE1QMiIsImV4cCI6MTcxMzY5OTM3MH0.m7EkGeqJvOR7vIZqEsf5Fl2llESGOPtGhKWeNE3E48o"
}

extension BibbiUserInterfaceString {
    static var dashboard = "Dashboard"
}
