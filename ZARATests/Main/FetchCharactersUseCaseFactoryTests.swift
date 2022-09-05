//
//  FetchCharactersUseCaseFactoryTests.swift
//  ZARATests
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import XCTest
@testable import ZARA

class FetchCharactersUseCaseFactoryTests: XCTestCase {

    func test() {
        // Given
        let sut = FetchCharactersUseCaseFactory()
        let useCase = sut.makeUseCase()
        let composer = useCase.output as? FetchCharactersUseCaseOutputComposer
        
        // Then
        XCTAssertNotNil(composer)
        XCTAssertEqual(composer?.outputs.count, 1)
        XCTAssertEqual(composer?.count(ofType: ListCharactersPresenter.self), 1)
    }
}

private extension FetchCharactersUseCaseOutputComposer {
    func count<T>(ofType: T.Type) -> Int {
        return outputs.filter { $0 is T }.count
    }
}

