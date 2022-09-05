//
//  AlertRouter.swift
//  ZARA
//
//  Created by Oscar Rodriguez Garrucho on 5/9/22.
//
//  Copyright (c) 2022 Oscar R. Garrucho. All rights reserved.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//

import Foundation

protocol AlertRoutingLogic {
    func dismiss()
}

final class AlertRouter: AlertRoutingLogic {
    
    // MARK: - Properties
    
    weak var viewController: AlertViewController?
    
    // MARK: - Routes
    
    func dismiss() {
        viewController?.dismiss(animated: false)
    }
}
