//
//  ListCharactersConfiguration.swift
//  ZARA
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import Foundation
import UIKit

final class ListCharactersConfiguration {
    
    static func getViewController() -> ListCharactersViewController {
        let configuration = configureModule()

        return configuration.viewController
    }
}

extension ListCharactersConfiguration {
    
    private static func configureModule() -> ListCharactersModule {
        let viewController = ListCharactersViewController()
        let useCase = FetchCharactersUseCaseFactory().makeUseCase()
        let composer = useCase.output as? FetchCharactersUseCaseOutputComposer
        let presenter = composer?.outputs.first as? ListCharactersPresenter
        let interactor = ListCharactersInteractor(useCase)
        let router = ListCharactersRouter()

        viewController.interactor = interactor
        viewController.router = router
        presenter?.view = viewController
        router.viewController = viewController

        return ListCharactersModule(viewController: viewController,
                                    interactor: interactor,
                                    presenter: presenter,
                                    router: router)
    }
    
    private struct ListCharactersModule {
        let viewController: ListCharactersViewController
        let interactor: ListCharactersInteractor?
        let presenter: ListCharactersPresenter?
        let router: ListCharactersRouter?
    }
}
