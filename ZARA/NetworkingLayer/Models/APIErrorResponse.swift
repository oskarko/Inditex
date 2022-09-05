//
//  APIErrorResponse.swift
//  ZARA
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import Foundation

struct APIErrorResponse: Codable {
    var error: String?

    enum CodingKeys: String, CodingKey {
        case error
    }

    init(error: String? = nil) {
        self.error = error
    }

    static let badURL: APIErrorResponse = .init(error: NSLocalizedString("Bad URL format", comment: ""))
    static let invalidData: APIErrorResponse = .init(error: NSLocalizedString("Invalid data", comment: ""))
    static let invalidJSON: APIErrorResponse = .init(error: NSLocalizedString("The server response didnt match our model", comment: ""))
}
