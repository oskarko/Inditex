//  ListCharactersPresenter.swift
//  ZARA
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import Foundation

protocol ListCharactersDisplayLogic: AnyObject {
    func reloadData(with characters: [Character])
    func showAlert(with message: String)
}

final class ListCharactersPresenter {
    
    // MARK: - Properties
    
    weak var view: ListCharactersDisplayLogic?
    
    private var characters: [Character]?
    
    // MARK: - Helpers
    
}

// MARK: - FetchCharactersUseCaseOutput

extension ListCharactersPresenter: FetchCharactersUseCaseOutput {
    func fetchCharactersSucceeded(_ characters: [Character]) {
        self.characters = characters
        view?.reloadData(with: characters)
    }
    
    func fetchCharactersFailed(error: APIErrorResponse) {
        view?.showAlert(with: error.message ?? "unknown error")
    }
    
    
}
