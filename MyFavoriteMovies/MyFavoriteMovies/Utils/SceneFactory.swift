//
//  SceneFactory.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 20/03/25.
//

import UIKit

protocol SceneFactory {
    associatedtype Dependencies
    static func build(with dependencies: Dependencies) -> UIViewController
}
