//
//  MockMovieWorker.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 23/03/25.
//

@testable import MyFavoriteMovies

class MockMovieWorker: MovieWorkerProtocol {
    var getMoviesCalled = false
    var getMovieDetailCalled = false
    var getMoviesResult: Result<[Movie], RequestError>!
    var getMovieDetailResult: Result<MovieDetail, RequestError>!
    
    func getMovies(for term: String, completion: @escaping (Result<[Movie], RequestError>) -> Void) {
        getMoviesCalled = true
        completion(getMoviesResult)
    }
    
    func getMovieDetail(for id: Int, completion: @escaping (Result<MovieDetail, RequestError>) -> Void) {
        getMovieDetailCalled = true
        completion(getMovieDetailResult)
    }
}
