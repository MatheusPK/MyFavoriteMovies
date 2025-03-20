//
//  MovieListFactory.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 20/03/25.
//

import UIKit

class MovieListFactory: SceneFactory {
    
    static func build() -> UIViewController {
        let movieListVC = MovieListViewController()
        return movieListVC
    }
    
}
