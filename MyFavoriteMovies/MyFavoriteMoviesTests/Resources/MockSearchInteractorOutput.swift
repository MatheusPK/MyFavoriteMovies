//
//  MockSearchInteractorOutput.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 23/03/25.
//

@testable import MyFavoriteMovies

class MockSearchInteractorOutput: SearchInteractorOutput {
    var searchWasSuccessfulCalled = false
    var searchFailedCalled = false
    var receivedMovies: [Movie]?
    var receivedError: RequestError?
    
    func searchWasSuccessful(with movies: [Movie]) {
        searchWasSuccessfulCalled = true
        receivedMovies = movies
    }
    
    func searchFailed(with error: RequestError) {
        searchFailedCalled = true
        receivedError = error
    }
}
