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
    
    var useCase: FetchCharactersUseCase

    // MARK: - Lifecycle
    
    init(_ composer: FetchCharactersUseCaseOutputComposer) {
        self.useCase = FetchCharactersUseCase(output: composer)
    }
    
    // MARK: - Helpers
    
    func fetchCharacters() {
        useCase.start()
    }
}
