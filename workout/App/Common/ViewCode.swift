//
//  ViewCode.swift
//  workout
//
//  Created by Guilherme dos Santos on 25/04/23.
//

import Foundation
protocol ViewCode {
    func buildViewHierrachy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension ViewCode {
    func setupView() {
        buildViewHierrachy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
}
