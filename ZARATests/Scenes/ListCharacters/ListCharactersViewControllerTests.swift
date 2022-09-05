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
        // Given
        let sut = ListCharactersConfiguration.getViewController()
        let interactor = ListCharactersBusinessLogicSpy()
        sut.interactor = interactor
        
        // When
        sut.loadViewIfNeeded()
        
        // Then
        XCTAssertEqual(interactor.fetchCount, 1)
    }
    
    
    func test_tableView_didSelectRowAt_delegatesSucceededMessage() {
        // Given
        let sut = ListCharactersConfiguration.getViewController()
        let interactor = ListCharactersBusinessLogicSpy()
        let presenter = ListCharactersPresenter()
        let routerSpy = ListCharactersRoutingLogicSpy()
        
        sut.interactor = interactor
        sut.router = routerSpy
        presenter.view = sut
        
        let mockedCharacter = Character(id: -1,
                                        name: "",
                                        status: "",
                                        species: "",
                                        type: "",
                                        gender: "",
                                        origin: Location(name: "", url: ""),
                                        location: Location(name: "", url: ""),
                                        image: "")
        
        // When
        sut.loadViewIfNeeded()
        presenter.fetchCharactersSucceeded([mockedCharacter])
        sut.tableView(sut.tableview, didSelectRowAt: IndexPath(row: 0, section: 0))
                
        // Then
        XCTAssertEqual(routerSpy.showCount, 1)
        XCTAssertEqual(routerSpy.character?.id, -1)
    }
    
    // MARK: - Helpers
    
    private class ListCharactersBusinessLogicSpy: ListCharactersBusinessLogic {
        var fetchCount = 0
        
        func fetchCharacters() {
            fetchCount += 1
        }
    }
    
    private class ListCharactersRoutingLogicSpy: ListCharactersRoutingLogic {
        var showCount = 0
        var character: Character?
        
        func showDetails(for character: Character) {
            showCount += 1
            self.character = character
        }
    }

}
