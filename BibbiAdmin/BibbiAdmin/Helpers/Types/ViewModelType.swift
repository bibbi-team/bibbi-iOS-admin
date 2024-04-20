//
//  ViewModelType.swift
//  BibbiAdmin
//
//  Created by 김건우 on 4/20/24.
//

import Combine

protocol ViewModelType {
    var cancellable: Set<AnyCancellable> { get set }
}
