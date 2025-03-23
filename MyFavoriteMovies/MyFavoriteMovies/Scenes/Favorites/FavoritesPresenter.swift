//
//  FavoritesPresenter.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 23/03/25.
//

class FavoritesPresenter: MovieListPresenterInput {
    
    private var movies: [Movie]
    weak var output: MovieListPresenterOutput?
    var interactor: MovieListInteractorInput
    var router: MovieListRouterProtocol
    
    var numberOfMovies: Int {
        movies.count
    }
    
    init(movies: [Movie], interactor: MovieListInteractorInput, router: MovieListRouterProtocol) {
        self.movies = movies
        self.interactor = interactor
        self.router = router
    }
    
    func movie(at index: Int) -> Movie {
        movies[index]
    }
    
    func didSelectMovie(at index: Int) {
        guard let movieId = movies[index].id else {
            return
        }
        
        router.navigateToDetail(movieId: movieId)
    }
    
    func didToggleFavorite(at index: Int) {
        let movie = movies[index]
        interactor.toggleFavorite(for: movie)
    }
    
    func isFavorite(movie: Movie) -> Bool {
        return interactor.isFavorite(movie: movie)
    }
}

extension FavoritesPresenter: MovieListInteractorOutput {
    func didToggleFavoriteSuccesfuly(for movie: Movie) {
        if !interactor.isFavorite(movie: movie) {
            movies.removeAll { $0.id == movie.id }
            self.output?.reloadData()
        }
    }
}
