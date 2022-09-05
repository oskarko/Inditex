//
//  ListCharactersViewControllerTests.swift
//  ZARATests
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import XCTest
@testable import ZARA

class ListCharactersViewControllerTests: XCTestCase {

    func test_callingViewDidLoad_delegatesSucceededMessage() {
        let sut = ListCharactersConfiguration.getViewController()
        let interactor = ListCharactersBusinessLogicSpy()
        sut.interactor = interactor
        
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(interactor.fetchCount, 1)
    }
    
    // MARK: - Helpers
    
    private class ListCharactersBusinessLogicSpy: ListCharactersBusinessLogic {
        var fetchCount = 0
        
        func fetchCharacters() {
            fetchCount += 1
        }
    }

}
