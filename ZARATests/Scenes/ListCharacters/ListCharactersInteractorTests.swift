//
//  ListCharactersInteractorTests.swift
//  ZARATests
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import XCTest
@testable import ZARA

class ListCharactersInteractorTests: XCTestCase {

    func test_fetchCharacters_delegatesSucceededMessage() {
        // Given
        let outputSpy = FetchCharactersUseCaseOutputComposerSpy()
        let useCaseSpy = FetchCharactersUseCaseSpy(outputSpy)
        let sut = ListCharactersInteractor(useCaseSpy)
        
        // When
        useCaseSpy.shouldSucceed = true
        sut.fetchCharacters(offset: 0)
        
        // Then
        XCTAssertEqual(outputSpy.fetchSucceededCallCount, 1)
        XCTAssertEqual(outputSpy.fetchFailedCallCount, 0)
    }
    
    func test_fetchCharacters_delegatesFailedMessage() {
        // Given
        let outputSpy = FetchCharactersUseCaseOutputComposerSpy()
        let useCaseSpy = FetchCharactersUseCaseSpy(outputSpy)
        let sut = ListCharactersInteractor(useCaseSpy)
        
        // When
        useCaseSpy.shouldSucceed = false
        sut.fetchCharacters(offset: 0)
        
        // Then
        XCTAssertEqual(outputSpy.fetchSucceededCallCount, 0)
        XCTAssertEqual(outputSpy.fetchFailedCallCount, 1)
    }
    
    // MARK: - Helpers
    
    private class FetchCharactersUseCaseSpy: FetchCharactersUseCase {
        var output: FetchCharactersUseCaseOutput
        var shouldSucceed = true
        
        init(_ output: FetchCharactersUseCaseOutput) {
            self.output = output
        }
        
        func start(offset: Int) {
            if shouldSucceed {
                output.fetchCharactersSucceeded([])
            } else {
                output.fetchCharactersFailed(error: .invalidData)
            }
        }
    }
    
    private class FetchCharactersUseCaseOutputComposerSpy: FetchCharactersUseCaseOutput {
        var fetchSucceededCallCount = 0
        var fetchFailedCallCount = 0
        
        func fetchCharactersSucceeded(_ characters: [Character]) {
            fetchSucceededCallCount += 1
        }
        
        func fetchCharactersFailed(error: APIErrorResponse) {
            fetchFailedCallCount += 1
        }
    }

}
