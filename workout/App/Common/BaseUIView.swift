//
//  BaseUIView.swift
//  workout
//
//  Created by Guilherme dos Santos on 25/04/23.
//

import Foundation
import UIKit

class BaseUIView: UIView {
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
    }
}
