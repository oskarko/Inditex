//
//  FetchCharactersUseCaseOutputComposerTests.swift
//  ZARATests
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import XCTest
@testable import ZARA

class FetchCharactersUseCaseOutputComposerTests: XCTestCase {

    func test_composingZeroOutputs_doesNotCrash() {
        // Given
        let sut = FetchCharactersUseCaseOutputComposer([])
        
        // When
        sut.fetchCharactersSucceeded([])
        sut.fetchCharactersFailed(error: .invalidJSON)
    }
    
    func test_composingOneOutput_delegatesSucceededMessage() {
        // Given
        let output1 = FetchCharactersUseCaseOutputSpy()
        let sut = FetchCharactersUseCaseOutputComposer([output1])
        
        // When
        sut.fetchCharactersSucceeded([])
        
        // Then
        XCTAssertEqual(output1.fetchSucceededCallCount, 1)
        XCTAssertEqual(output1.fetchFailedCallCount, 0)
    }
    
    func test_composingMultipleOutputs_delegatesSucceededMessage() {
        // Given
        let output1 = FetchCharactersUseCaseOutputSpy()
        let output2 = FetchCharactersUseCaseOutputSpy()
        let sut = FetchCharactersUseCaseOutputComposer([output1, output2])
        
        // When
        sut.fetchCharactersSucceeded([])
        
        // Then
        XCTAssertEqual(output1.fetchSucceededCallCount, 1)
        XCTAssertEqual(output1.fetchFailedCallCount, 0)
        
        XCTAssertEqual(output2.fetchSucceededCallCount, 1)
        XCTAssertEqual(output2.fetchFailedCallCount, 0)
    }
    
    func test_composingMultipleOutputs_delegatesFailedMessage() {
        // Given
        let output1 = FetchCharactersUseCaseOutputSpy()
        let output2 = FetchCharactersUseCaseOutputSpy()
        let sut = FetchCharactersUseCaseOutputComposer([output1, output2])
        
        // When
        sut.fetchCharactersFailed(error: .badURL)
        
        // Then
        XCTAssertEqual(output1.fetchSucceededCallCount, 0)
        XCTAssertEqual(output1.fetchFailedCallCount, 1)
        
        XCTAssertEqual(output2.fetchSucceededCallCount, 0)
        XCTAssertEqual(output2.fetchFailedCallCount, 1)
    }
    
    
    // MARK: - Helpers
    
    private class FetchCharactersUseCaseOutputSpy: FetchCharactersUseCaseOutput {
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
