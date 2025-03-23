//
//  MovieListInteractor.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 21/03/25.
//

protocol MovieListInteractorInput {
    func toggleFavorite(for movie: Movie)
}

protocol MovieListInteractorOutput: AnyObject {
    func didToggleFavoriteSuccesfuly(for movie: Movie)
}

class MovieListInteractor: MovieListInteractorInput {
    weak var output: MovieListInteractorOutput?
    
    func toggleFavorite(for movie: Movie) {
        output?.didToggleFavoriteSuccesfuly(for: movie)
    }
}
