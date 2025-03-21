//
//  SearchInteractor.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 20/03/25.
//

protocol SearchInteractorInput: AnyObject {
    func search(term: String)
}

protocol SearchInteractorOutput: AnyObject {
    func searchWasSuccessful(with movies: [String]?)
    func searchFailed(with error: RequestError)
}

class SearchInteractor: SearchInteractorInput {
    weak var output: SearchInteractorOutput?
    
    private var movieWorker: MovieWorkerProtocol
    
    init(movieWorker: MovieWorkerProtocol) {
        self.movieWorker = movieWorker
    }
    
    func search(term: String) {
        movieWorker.getMovies(for: term) { [weak self] result in
            switch result {
            case .success(let movies):
                self?.output?.searchWasSuccessful(with: movies)
            case .failure(let error):
                self?.output?.searchFailed(with: error)
            }
        }
    }
}
