//
//  WorkoutDetailView.swift
//  workout
//
//  Created by Guilherme dos Santos on 27/04/23.
//

import UIKit

protocol WorkoutDetailViewDelegate: AnyObject {
    
}

class WorkoutDetailView: BaseUIView {
    weak var delegate: WorkoutDetailViewDelegate?
    
    init() {
        super.init(frame: .zero)
        self.setupView()
    }
}

extension WorkoutDetailView: ViewCode {
    func buildViewHierrachy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func setupAdditionalConfiguration() {
        
    }
}
