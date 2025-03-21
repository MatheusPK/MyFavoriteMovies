//
//  SearchPresenter.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 21/03/25.
//

protocol SearchPresenterInput {
    func search(term: String?)
}

protocol SearchPresenterOutput: AnyObject {
    func setLoading(isActive: Bool)
    func setError(isActive: Bool)
    func showEmptyTermAlert()
}

class SearchPresenter: SearchPresenterInput {
    
    weak var output: SearchPresenterOutput?
    var interactor: SearchInteractorInput
    var router: SearchRouterProtocol
    
    
    init(interactor: SearchInteractorInput, router: SearchRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func search(term: String?) {
        guard let term, !term.isEmpty else {
            output?.showEmptyTermAlert()
            return
        }
        
        output?.setError(isActive: false)
        output?.setLoading(isActive: true)
        interactor.search(term: term)
    }
}

extension SearchPresenter: SearchInteractorOutput {
    func searchWasSuccessful(with movies: [String] ) {
        output?.setLoading(isActive: false)
        router.goToMovieList(movies: movies)
    }
    
    func searchFailed(with error: RequestError) {
        output?.setLoading(isActive: false)
        output?.setError(isActive: true)
    }
}
