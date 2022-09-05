//
//  FetchCharactersUseCaseOutputComposer.swift
//  ZARA
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import Foundation

final class FetchCharactersUseCaseOutputComposer {
    
    let outputs: [FetchCharactersUseCaseOutput]
    
    init(_ outputs: [FetchCharactersUseCaseOutput]) {
        self.outputs = outputs
    }
}

// MARK: - FetchCharactersUseCaseOutput

extension FetchCharactersUseCaseOutputComposer: FetchCharactersUseCaseOutput {
    
    func fetchCharactersSucceeded(_ characters: [Character]) {
        outputs.forEach { $0.fetchCharactersSucceeded(characters) }
    }
    
    func fetchCharactersFailed(error: APIErrorResponse) {
        outputs.forEach { $0.fetchCharactersFailed(error: error) }
    }
}
