//
//  ViewCode.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 20/03/25.
//

protocol ViewCode {
    func setup()
    func addSubviews()
    func addConstraints()
}

extension ViewCode {
    func setup() {
        addSubviews()
        addConstraints()
    }
}

