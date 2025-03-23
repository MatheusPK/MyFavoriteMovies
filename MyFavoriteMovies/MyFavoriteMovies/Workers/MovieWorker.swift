//
//  MovieWorker.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 21/03/25.
//

protocol MovieWorkerProtocol {
    func getMovies(for term: String, completion: @escaping (Result<[Movie], RequestError>) -> Void)
}

class MovieWorker: MovieWorkerProtocol {
    let requestProvider: RequestProviderProtocol
    
    init(requestProvider: RequestProviderProtocol) {
        self.requestProvider = requestProvider
    }
    
    func getMovies(for term: String, completion: @escaping (Result<[Movie], RequestError>) -> Void) {
        requestProvider.make(MoviesRequest.movies(term: term)) { (result: (Result<MoviesResult, RequestError>)) in
            switch result {
            case .success(let moviesResult):
                if let movies = moviesResult.results, !movies.isEmpty {
                    completion(.success(movies))
                    return
                }
                
                completion(.failure(.emptyData))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
