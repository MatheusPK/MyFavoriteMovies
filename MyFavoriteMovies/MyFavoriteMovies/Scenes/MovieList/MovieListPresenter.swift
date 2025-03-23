//
//  MovieListPresenter.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 21/03/25.
//

protocol MovieListPresenterInput {
    var numberOfMovies: Int { get }
    func movie(at index: Int) -> Movie
    func didSelectMovie(at index: Int)
    func didToggleFavorite(at index: Int)
}

protocol MovieListPresenterOutput: AnyObject {
    func reloadData()
}

class MovieListPresenter: MovieListPresenterInput {
    
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
}

extension MovieListPresenter: MovieListInteractorOutput {
    func didToggleFavoriteSuccesfuly(for movie: Movie) {
        // atualizar filme favorito aqui
        output?.reloadData()
    }
}
