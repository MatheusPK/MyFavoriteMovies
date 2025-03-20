//
//  SceneFactory.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 20/03/25.
//

import UIKit

protocol SceneFactory {
    static func build() -> UIViewController
}
