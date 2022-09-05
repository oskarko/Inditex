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
    func insertItems(with characters: [Character], at indexPathsToReload: [IndexPath])
    func showAlert(with message: String)
}

final class ListCharactersPresenter {
    
    // MARK: - Properties
    
    weak var view: ListCharactersDisplayLogic?
    
    private var characters: [Character] = []
    
    // MARK: - Helpers
    
    private func calculateIndexPathsToReload(from newCharacters: [Character]) -> [IndexPath] {
      let startIndex = characters.count - newCharacters.count
      let endIndex = startIndex + newCharacters.count
      return (startIndex..<endIndex).map { IndexPath(row: $0, section: 0) }
    }
    
}

// MARK: - FetchCharactersUseCaseOutput

extension ListCharactersPresenter: FetchCharactersUseCaseOutput {
    func fetchCharactersSucceeded(_ characters: [Character]) {
        if !self.characters.isEmpty { // is offset zero?
            self.characters.append(contentsOf: characters)
            let indexPathsToRelod = calculateIndexPathsToReload(from: characters)
            view?.insertItems(with: self.characters, at: indexPathsToRelod)
        } else {
            self.characters = characters
            view?.reloadData(with: self.characters)
        }
    }
    
    func fetchCharactersFailed(error: APIErrorResponse) {
        view?.showAlert(with: error.error ?? "unknown error")
    }
    
    
}
