//
//  MovieDetailPresenter.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 23/03/25.
//

protocol MovieDetailPresenterInput {
    func getMovieDetails()
}

protocol MovieDetailPresenterOutput: AnyObject {
    func showMovieDetails(_ movieDetail: MovieDetail)
    func setLoading(isActive: Bool)
    func setError(isActive: Bool)
}

class MovieDetailPresenter: MovieDetailPresenterInput {
    weak var output: MovieDetailPresenterOutput?
    var interactor: MovieDetailInteractorInput
    var movieId: Int
    
    init(movieId: Int, interactor: MovieDetailInteractorInput) {
        self.movieId = movieId
        self.interactor = interactor
    }
    
    func getMovieDetails() {
        output?.setError(isActive: false)
        output?.setLoading(isActive: true)
        interactor.getMovieDetail(for: movieId)
    }
}

extension MovieDetailPresenter: MovieDetailInteractorOutput {
    func didReceiveMovieDetail(_ movieDetail: MovieDetail) {
        output?.setLoading(isActive: false)
        output?.showMovieDetails(movieDetail)
    }
    
    func didFailWithError(_ error: any Error) {
        output?.setLoading(isActive: false)
        output?.setError(isActive: true)
    }
}

    
