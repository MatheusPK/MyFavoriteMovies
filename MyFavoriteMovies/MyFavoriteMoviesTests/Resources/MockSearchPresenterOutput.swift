//
//  MockSearchPresenterOutput.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 23/03/25.
//

@testable import MyFavoriteMovies

class MockSearchPresenterOutput: SearchPresenterOutput {
    var setLoadingCalled = false
    var setErrorCalled = false
    var showEmptyTermAlertCalled = false
    
    var lastLoadingState: Bool?
    var lastErrorState: Bool?
    
    func setLoading(isActive: Bool) {
        lastLoadingState = isActive
        setLoadingCalled = true
    }
    
    func setError(isActive: Bool) {
        lastErrorState = isActive
        setErrorCalled = true
    }
    
    func showEmptyTermAlert() {
        showEmptyTermAlertCalled = true
    }
}
