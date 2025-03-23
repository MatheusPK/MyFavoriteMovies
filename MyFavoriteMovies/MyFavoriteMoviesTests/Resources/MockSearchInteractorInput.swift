//
//  MockSearchInteractorInput.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 23/03/25.
//

@testable import MyFavoriteMovies

class MockSearchInteractorInput: SearchInteractorInput {
    var searchCalled = false
    func search(term: String) {
        searchCalled = true
    }
}
