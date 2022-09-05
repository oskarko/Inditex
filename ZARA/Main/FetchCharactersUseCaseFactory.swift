//
//  FetchCharactersUseCaseFactory.swift
//  ZARA
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import Foundation

final class FetchCharactersUseCaseFactory {
    
    func makeUseCase() -> FetchCharactersUseCase {
        FetchCharactersUseCaseImp(output: FetchCharactersUseCaseOutputComposer([
            ListCharactersPresenter() // and so on...
        ]))
    }
}
