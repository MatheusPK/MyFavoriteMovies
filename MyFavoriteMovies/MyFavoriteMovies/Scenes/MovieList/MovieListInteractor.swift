//
//  MovieListInteractor.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 21/03/25.
//

protocol MovieListInteractorInput {
    func isFavorite(movie: Movie) -> Bool
    func toggleFavorite(for movie: Movie)
    func getFavorites() -> [Movie]
}

protocol MovieListInteractorOutput: AnyObject {
    func didToggleFavoriteSuccesfuly(for movie: Movie)
}

class MovieListInteractor: MovieListInteractorInput {
    
    weak var output: MovieListInteractorOutput?
    private var worker: FavoriteMovieWorker
    
    init(worker: FavoriteMovieWorker) {
        self.worker = worker
    }
    
    func isFavorite(movie: Movie) -> Bool {
        return worker.isFavorite(movie: movie)
    }
    
    func toggleFavorite(for movie: Movie) {
        worker.toggleFavorite(movie: movie)
        output?.didToggleFavoriteSuccesfuly(for: movie)
    }
    
    func getFavorites() -> [Movie] {
        worker.getFavorites()
    }
}
