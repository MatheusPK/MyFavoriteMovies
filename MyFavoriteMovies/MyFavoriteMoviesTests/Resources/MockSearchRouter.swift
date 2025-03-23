//
//  MockSearchRouter.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 23/03/25.
//

@testable import MyFavoriteMovies

class MockSearchRouter: SearchRouterProtocol {
    var goToMovieListCalled = false
    var receivedMovies: [Movie] = []
    
    func goToMovieList(movies: [Movie]) {
        goToMovieListCalled = true
        receivedMovies = movies
    }
}
