//
//  BaseViewController.swift
//  workout
//
//  Created by Guilherme dos Santos on 25/04/23.
//

import Foundation
import UIKit

class BaseViewController<CustomView: UIView>: UIViewController {
    var customView: CustomView! {
        return self.view as? CustomView
    }
    
    override func loadView() {
        self.navigationController?.isNavigationBarHidden = true
        self.view = CustomView()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
