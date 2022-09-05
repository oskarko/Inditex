//
//  CharactersRequest.swift
//  ZARA
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import Foundation

enum CharactersRequest {
    case fetchCharacters(_ model: CharactersRequestModel)
}

extension CharactersRequest: APIRequest {

    var path: APIPath {
        switch self {
        case .fetchCharacters: return .characters
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case let .fetchCharacters(model):
            return [URLQueryItem(name: "page", value: String(model.page))]
        }
    }
}
