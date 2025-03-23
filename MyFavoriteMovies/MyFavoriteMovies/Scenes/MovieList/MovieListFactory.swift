//
//  MovieListFactory.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 20/03/25.
//

import UIKit

class MovieListFactory: SceneFactory {
    
    struct Dependencies {
        let movies: [Movie]
    }
    
    static func build(with dependecies: Dependencies) -> UIViewController {
        let interactor = MovieListInteractor()
        
        let router = MovieListRouter()
        
        let presenter = MovieListPresenter(movies: dependecies.movies, interactor: interactor, router: router)
        interactor.output = presenter
        
        let movieListVC = MovieListViewController(presenter: presenter)
        presenter.output = movieListVC
        router.viewController = movieListVC
        
        
        return movieListVC
    }
    
}
