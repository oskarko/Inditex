//
//  CharactersResponse.swift
//  ZARA
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import Foundation

struct CharactersResponse: Codable {
    let info: ChractersResponseInfo
    let results: [Character]
    
    enum CodingKeys: String, CodingKey {
        case info
        case results
    }
}

// MARK: - ChractersResponseInfo

struct ChractersResponseInfo: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
       
    enum CodingKeys: String, CodingKey {
        case count
        case pages
        case next
        case prev
    }
}

// MARK: - Character

struct Character: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case status
        case species
        case type
        case gender
        case image
    }
}
