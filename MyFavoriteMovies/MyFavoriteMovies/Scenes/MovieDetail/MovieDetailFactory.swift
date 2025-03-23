//
//  MovieDetailFactory.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 20/03/25.
//

import UIKit

class MovieDetailFactory: SceneFactory {
    struct Dependencies {}
    
    static func build(with dependencies: Dependencies) -> UIViewController {
        let movieDetailVC = MovieDetailViewController()
        return movieDetailVC
    }
    
}
