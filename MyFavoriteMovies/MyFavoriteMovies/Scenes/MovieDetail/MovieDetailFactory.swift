//
//  MovieDetailFactory.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 20/03/25.
//

import UIKit

class MovieDetailFactory: SceneFactory {
    struct Dependencies {
        let movieId: Int
    }
    
    static func build(with dependencies: Dependencies) -> UIViewController {
        let requestProvider = RequestProvider()
        let movieWorker = MovieWorker(requestProvider: requestProvider)
        let interactor = MovieDetailInteractor(movieWorker: movieWorker)
        
        let presenter = MovieDetailPresenter(movieId: dependencies.movieId, interactor: interactor)
        interactor.output = presenter
        
        let movieDetailVC = MovieDetailViewController(presenter: presenter)
        presenter.output = movieDetailVC
        
        return movieDetailVC
    }
    
}
