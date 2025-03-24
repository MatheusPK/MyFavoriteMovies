//
//  SearchRouterTests.swift
//  MyFavoriteMoviesTests
//
//  Created by Matheus Pereira Kulick on 23/03/25.
//

import XCTest
@testable import MyFavoriteMovies

final class SearchRouterTests: XCTestCase {
    
    var sut: SearchRouter!
    var mockNavigationController: MockNavigationController!

    override func setUpWithError() throws {
        sut = SearchRouter()
        let vc = UIViewController()
        mockNavigationController = MockNavigationController(rootViewController: vc)
        sut.viewController = vc
    }

    override func tearDownWithError() throws {
        sut = nil
        mockNavigationController = nil
    }

    func test_goToMovieList_withValidMovies_pushesMovieListViewController() {
        let movies = [
            Movie(id: 1, originalTitle: "Movie 1"),
            Movie(id: 2, originalTitle: "Movie 2")
        ]
        
        let expectation = expectation(description: "Push view controller should be called")

        sut.goToMovieList(movies: movies)

        DispatchQueue.main.async {
            XCTAssertTrue(self.mockNavigationController.pushViewControllerCalled)
            XCTAssertTrue(self.mockNavigationController.pushedViewController is MovieListViewController)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }
}
