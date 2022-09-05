//
//  FetchCharactersUseCase.swift
//  ZARA
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import Foundation

protocol FetchCharactersUseCase {
    var output: FetchCharactersUseCaseOutput { get }
    func start(offset: Int)
}

protocol FetchCharactersUseCaseOutput {
    func fetchCharactersSucceeded(_ characters: [Character])
    func fetchCharactersFailed(error: APIErrorResponse)
}

final class FetchCharactersUseCaseImp: FetchCharactersUseCase {
    
    private var service: CharactersServiceProtocol
    var output: FetchCharactersUseCaseOutput
    
    init(_ service: CharactersServiceProtocol = CharactersService(), output: FetchCharactersUseCaseOutput) {
        self.service = service
        self.output = output
    }
    
    func start(offset: Int) {
        let page = (offset / Constants.CHARACTERS_BY_PAGE) + 1
        let model = CharactersRequestModel(page: page)
        service.fetchCharacters(model, completionHandler: { [weak self] result in
            guard let self = self else { return }

            switch result {
            case let .success(charactersResponse):
                self.output.fetchCharactersSucceeded(charactersResponse.results)
            case let .failure(error):
                    print(error)
                self.output.fetchCharactersFailed(error: error)
            }
        })
    }
}
