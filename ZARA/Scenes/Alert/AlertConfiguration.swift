//
//  AlertConfiguration.swift
//  ZARA
//
//  Created by Oscar Rodriguez Garrucho on 5/9/22.
//
//  Copyright (c) 2022 Oscar R. Garrucho. All rights reserved.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//

import Foundation
import UIKit

final class AlertConfiguration {
    
    static func getViewController() -> AlertViewController {
        let configuration = configureModule()

        return configuration.viewController
    }
}

extension AlertConfiguration {
    
    private static func configureModule() -> AlertModule {
        let viewController = AlertViewController()
        let interactor = AlertInteractor()
        let presenter = AlertPresenter()
        let router = AlertRouter()

        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.view = viewController
        router.viewController = viewController

        return AlertModule(viewController: viewController,
                                    interactor: interactor,
                                    presenter: presenter,
                                    router: router)
    }
    
    private struct AlertModule {
        let viewController: AlertViewController
        let interactor: AlertInteractor
        let presenter: AlertPresenter
        let router: AlertRouter
    }
}
