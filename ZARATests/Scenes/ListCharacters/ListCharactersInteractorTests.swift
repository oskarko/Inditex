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
        let outputSpy = FetchCharactersUseCaseOutputComposerSpy()
        let useCaseSpy = FetchCharactersUseCaseSpy(outputSpy)
        let sut = ListCharactersInteractor(useCaseSpy)
        
        useCaseSpy.shouldSucceed = true
        sut.fetchCharacters()
        
        XCTAssertEqual(outputSpy.fetchSucceededCallCount, 1)
        XCTAssertEqual(outputSpy.fetchFailedCallCount, 0)
    }
    
    func test_fetchCharacters_delegatesFailedMessage() {
        let outputSpy = FetchCharactersUseCaseOutputComposerSpy()
        let useCaseSpy = FetchCharactersUseCaseSpy(outputSpy)
        let sut = ListCharactersInteractor(useCaseSpy)
        
        useCaseSpy.shouldSucceed = false
        sut.fetchCharacters()
        
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
        
        func start() {
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
