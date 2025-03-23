//
//  MovieListPresenterProtocol.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 23/03/25.
//

protocol MovieListPresenterInput {
    var numberOfMovies: Int { get }
    func movie(at index: Int) -> Movie
    func didSelectMovie(at index: Int)
    func didToggleFavorite(at index: Int)
    func isFavorite(movie: Movie) -> Bool
    func reloadMovies()
}

protocol MovieListPresenterOutput: AnyObject {
    func reloadData()
}
