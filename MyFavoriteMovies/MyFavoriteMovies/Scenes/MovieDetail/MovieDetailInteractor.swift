//
//  MovieDetailInteractor.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 23/03/25.
//

protocol MovieDetailInteractorInput {
    func getMovieDetail(for movieId: Int)
}

protocol MovieDetailInteractorOutput: AnyObject {
    func didReceiveMovieDetail(_ movieDetail: MovieDetail)
    func didFailWithError(_ error: Error)
}

class MovieDetailInteractor: MovieDetailInteractorInput {
    
    weak var output: MovieDetailInteractorOutput?
    
    private var worker: MovieWorkerProtocol
    
    init(movieWorker: MovieWorkerProtocol) {
        self.worker = movieWorker
    }
    
    func getMovieDetail(for movieId: Int) {
        worker.getMovieDetail(for: movieId) { result in
                switch result {
                case .success(let movieDetail):
                    self.output?.didReceiveMovieDetail(movieDetail)
                case .failure(let error):
                    self.output?.didFailWithError(error)
            }
        }
    }
}
