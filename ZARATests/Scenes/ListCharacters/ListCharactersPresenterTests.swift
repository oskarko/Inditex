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

    func test_fetchCharacters_firstTime_delegatesSucceededMessage() {
        // Given
        let sut = ListCharactersPresenter()
        let view = ListCharactersDisplayLogicSpy()
        sut.view = view
        
        // When
        sut.fetchCharactersSucceeded([])
        
        // Then
        XCTAssertEqual(view.reloadCount, 1)
    }
    
    func test_fetchCharacters_showError_delegatesSucceededMessage() {
        // Given
        let sut = ListCharactersPresenter()
        let view = ListCharactersDisplayLogicSpy()
        sut.view = view
        
        // When
        sut.view?.showAlert(with: "mock alert message")
        
        // Then
        XCTAssertEqual(view.reloadCount, 1)
        XCTAssertEqual(view.message, "mock alert message")
    }
    
    // MARK: - Helpers
    
    private class ListCharactersDisplayLogicSpy: ListCharactersDisplayLogic {
        var reloadCount = 0
        var message: String?
        
        func reloadData(with characters: [Character]) {
            reloadCount += 1
        }
        
        func insertItems(with characters: [Character], at indexPathsToReload: [IndexPath]) {
            reloadCount += 1
        }
        
        func showAlert(with message: String) {
            reloadCount += 1
            self.message = message
        }
    }

}
