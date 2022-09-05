//
//  CharacterDetailsConfiguration.swift
//  ZARA
//
//  Created by Oscar Rodriguez Garrucho on 5/9/22.
//
//  Copyright (c) 2022 Oscar R. Garrucho. All rights reserved.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//

import Foundation
import UIKit

final class CharacterDetailsConfiguration {
    
    static func getViewController(for character: Character) -> CharacterDetailsViewController {
        let configuration = configureModule()
        let viewController = configuration.viewController
        viewController.character = character
        return viewController
    }
}

extension CharacterDetailsConfiguration {
    
    private static func configureModule() -> CharacterDetailsModule {
        let viewController = CharacterDetailsViewController()
        let interactor = CharacterDetailsInteractor()
        let presenter = CharacterDetailsPresenter()
        let router = CharacterDetailsRouter()

        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.view = viewController
        router.viewController = viewController

        return CharacterDetailsModule(viewController: viewController,
                                    interactor: interactor,
                                    presenter: presenter,
                                    router: router)
    }
    
    private struct CharacterDetailsModule {
        let viewController: CharacterDetailsViewController
        let interactor: CharacterDetailsInteractor
        let presenter: CharacterDetailsPresenter
        let router: CharacterDetailsRouter
    }
}
