//
//  APIPath.swift
//  ZARA
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import Foundation

enum APIPath {
    case characters
    
    var rawValue: String {
        switch self {
        case .characters: return "/api/character"
        }
    }
}
