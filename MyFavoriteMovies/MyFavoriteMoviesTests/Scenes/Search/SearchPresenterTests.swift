//
//  SearchPresenterTests.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 23/03/25.
//

import XCTest
@testable import MyFavoriteMovies

final class SearchPresenterTests: XCTestCase {
    
    var sut: SearchPresenter!
    var interactor: MockSearchInteractorInput!
    var router: MockSearchRouter!
    var output: MockSearchPresenterOutput!

    override func setUpWithError() throws {
        interactor = MockSearchInteractorInput()
        router = MockSearchRouter()
        output = MockSearchPresenterOutput()
        sut = SearchPresenter(interactor: interactor, router: router)
        sut.output = output
    }

    override func tearDownWithError() throws {
        interactor = nil
        router = nil
        output = nil
        sut = nil
    }
    
    func test_search_withValidTerm_callsInteractorAndShowsLoading() {
        sut.search(term: "Batman")
        
        XCTAssertTrue(output.setLoadingCalled)
        XCTAssertTrue(output.setErrorCalled)
        XCTAssertTrue(interactor.searchCalled)
        XCTAssertEqual(output.lastLoadingState, true)
        XCTAssertEqual(output.lastErrorState, false)
    }
    
    func test_search_withEmptyTerm_showsAlertAndStopsLoading() {
        sut.search(term: "")
        
        XCTAssertTrue(output.showEmptyTermAlertCalled)
        XCTAssertFalse(interactor.searchCalled)
        XCTAssertTrue(output.setLoadingCalled)
        XCTAssertTrue(output.setErrorCalled)
        XCTAssertEqual(output.lastLoadingState, false)
        XCTAssertEqual(output.lastErrorState, false)
    }
    
    func test_searchWasSuccessful_navigatesToMovieList() {
        let movies = [Movie(id: 1, originalTitle: "Movie 1"), Movie(id: 2, originalTitle: "Movie 2")]
        
        sut.searchWasSuccessful(with: movies)
        
        XCTAssertTrue(router.goToMovieListCalled)
        XCTAssertEqual(router.receivedMovies, movies)
        XCTAssertTrue(output.setLoadingCalled)
        XCTAssertEqual(output.lastLoadingState, false)
    }
    
    func test_searchFailed_showsError() {
        sut.searchFailed(with: .invalidResponse)
        
        XCTAssertTrue(output.setErrorCalled)
        XCTAssertTrue(output.setLoadingCalled)
        XCTAssertEqual(output.lastLoadingState, false)
        XCTAssertEqual(output.lastErrorState, true)
    }
}


