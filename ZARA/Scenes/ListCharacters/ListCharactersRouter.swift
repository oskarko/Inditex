//  ListCharactersRouter.swift
//  ZARA
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import Foundation

protocol ListCharactersRoutingLogic {
    func showDetails(for character: Character)
}

final class ListCharactersRouter: ListCharactersRoutingLogic {
    
    // MARK: - Properties
    
    weak var viewController: ListCharactersViewController?
    
    // MARK: - Routes
    
    func showDetails(for character: Character) {
        let detailsView = CharacterDetailsConfiguration.getViewController(for: character)
        viewController?.navigationController?.pushViewController(detailsView, animated: true)
    }
    
}
