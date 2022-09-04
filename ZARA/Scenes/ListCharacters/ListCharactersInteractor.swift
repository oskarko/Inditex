//
//  ListCharactersInteractor.swift
//  ZARA
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import Foundation

protocol ListCharactersBusinessLogic {
    func fetchCharacters()
}

final class ListCharactersInteractor: ListCharactersBusinessLogic {
    
    // MARK: - Properties
    
    var presenter: ListCharactersPresenter?
    var useCase: FetchCharactersUseCase?

    // MARK: - Lifecycle
    
//    init(_ useCase: FetchCharactersUseCase = FetchCharactersUseCase()) {
//        self.useCase = useCase
//    }
    
    // MARK: - Helpers
    
    func fetchCharacters() {
        useCase = FetchCharactersUseCase(output: presenter!)
        useCase?.start()
    }
    
}
