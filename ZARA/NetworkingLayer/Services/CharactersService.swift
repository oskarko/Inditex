//
//  CharactersService.swift
//  ZARA
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import Foundation

protocol CharactersServiceProtocol {
    func fetchCharacters(completionHandler: @escaping (ResultResponse<CharactersResponse>) -> Void)
}

final class CharactersService: CharactersServiceProtocol {
    private let networkRequester: NetworkRequester

    init(networkRequester: NetworkRequester = .init()) {
        self.networkRequester = networkRequester
    }

    // MARK: - HomeServiceProtocol Functions

    func fetchCharacters(completionHandler: @escaping (ResultResponse<CharactersResponse>) -> Void) {
        let request = CharactersRequest.fetchCharacters
        networkRequester.doRequest(request: request, completionHandler: completionHandler)
    }

}

