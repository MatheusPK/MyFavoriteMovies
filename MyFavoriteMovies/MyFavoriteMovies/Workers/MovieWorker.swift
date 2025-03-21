//
//  MovieWorker.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 21/03/25.
//

protocol MovieWorkerProtocol {
    func getMovies(for term: String, completion: @escaping (Result<[String], RequestError>) -> Void)
}

class MovieWorker: MovieWorkerProtocol {
    let requestProvider: RequestProvider
    
    init(requestProvider: RequestProvider) {
        self.requestProvider = requestProvider
    }
    
    func getMovies(for term: String, completion: @escaping (Result<[String], RequestError>) -> Void) {}
    
}
