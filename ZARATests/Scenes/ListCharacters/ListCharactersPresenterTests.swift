//
//  ListCharactersPresenterTests.swift
//  ZARATests
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import XCTest
@testable import ZARA

class ListCharactersPresenterTests: XCTestCase {

    func test_fetchCharacters_delegatesSucceededMessage() {
        // Given
        let sut = ListCharactersPresenter()
        let view = ListCharactersDisplayLogicSpy()
        sut.view = view
        
        // When
        sut.fetchCharactersSucceeded([])
        
        // Then
        XCTAssertEqual(view.reloadCount, 1)
    }
    
    // MARK: - Helpers
    
    private class ListCharactersDisplayLogicSpy: ListCharactersDisplayLogic {
        var reloadCount = 0
        
        func reloadData(with characters: [Character]) {
            reloadCount += 1
        }
    }

}
