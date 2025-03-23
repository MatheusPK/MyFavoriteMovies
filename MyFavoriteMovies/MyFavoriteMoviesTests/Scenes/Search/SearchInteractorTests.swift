//
//  SearchInteractorTests.swift
//  MyFavoriteMoviesTests
//
//  Created by Matheus Pereira Kulick on 23/03/25.
//

import XCTest
@testable import MyFavoriteMovies

final class SearchInteractorTests: XCTestCase {
    
    var sut: SearchInteractor!
    var movieWorker: MockMovieWorker!
    var output: MockSearchInteractorOutput!

    override func setUpWithError() throws {
        output = MockSearchInteractorOutput()
        movieWorker = MockMovieWorker()
        sut = SearchInteractor(movieWorker: movieWorker)
        sut.output = output
    }

    override func tearDownWithError() throws {
        output = nil
        movieWorker = nil
        sut = nil
    }
    
    func test_search_withTermWithResults_returnsMoviesSuccessfully() {
        let expectedMovies = [
            Movie(id: 1, originalTitle: "Movie 1"),
            Movie(id: 2, originalTitle: "Movie 2")
        ]
        movieWorker.getMoviesResult = .success(expectedMovies)
        
        sut.search(term: "Batman")
        
        XCTAssertTrue(output.searchWasSuccessfulCalled)
        XCTAssertTrue(movieWorker.getMoviesCalled)
        XCTAssertEqual(output.receivedMovies, expectedMovies)
    }
    
    func test_search_withTermWithoutResults_returnsError() {
        let expectedError = RequestError.invalidResponse
        movieWorker.getMoviesResult = .failure(expectedError)
        
        sut.search(term: "fsfdsfsdf")
        
        XCTAssertTrue(output.searchFailedCalled)
        XCTAssertTrue(movieWorker.getMoviesCalled)
        
        switch output.receivedError {
        case .invalidResponse:
            break
        default:
            XCTFail()
        }
    }

}
