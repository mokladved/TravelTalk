//
//  Configurable.swift
//  TravelTalk
//
//  Created by Youngjun Kim on 7/23/25.
//

import Foundation

protocol UIConfigurable {
    func configureUI()
}

protocol DataConfigurable {
    associatedtype Model
    func configure(from model: Model)
}
