//
//  CharactersRequestModel.swift
//  ZARA
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import Foundation

struct CharactersRequestModel: Codable {
    let page: Int

    enum CodingKeys: String, CodingKey {
        case page
    }
}
