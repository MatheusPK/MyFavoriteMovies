//
//  SearchFactory.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 20/03/25.
//

import UIKit

class SearchFactory: SceneFactory {
    struct Dependencies {}
    
    static func build(with dependencies: Dependencies) -> UIViewController {
        let requestProvider = RequestProvider()
        let movieWorker = MovieWorker(requestProvider: requestProvider)
        let interactor = SearchInteractor(movieWorker: movieWorker)
        
        let router = SearchRouter()
        
        let presenter = SearchPresenter(interactor: interactor, router: router)
        interactor.output = presenter
        
        let searchVC = SearchViewController(presenter: presenter)
        presenter.output = searchVC
        router.viewController = searchVC
        
        
        return searchVC
    }
    
}
