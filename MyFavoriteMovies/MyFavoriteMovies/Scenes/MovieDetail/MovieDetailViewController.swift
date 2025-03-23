//
//  MovieDetailViewController.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 20/03/25.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    private lazy var movieDetailView: MovieDetailView = {
        let view = MovieDetailView()
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var loadingView: UIActivityIndicatorView = {
        let progressView = UIActivityIndicatorView(style: .large)
        progressView.hidesWhenStopped = true
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    private lazy var errorView: ErrorView = {
        let errorView = ErrorView()
        errorView.translatesAutoresizingMaskIntoConstraints = false
        errorView.isHidden = true
        return errorView
    }()
    
    var presenter: MovieDetailPresenterInput
    
    init(presenter: MovieDetailPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.getMovieDetails()
    }
}

extension MovieDetailViewController: ViewCode {
    func addSubviews() {
        view.addSubview(movieDetailView)
        view.addSubview(loadingView)
        view.addSubview(errorView)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            movieDetailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            movieDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            movieDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            movieDetailView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            errorView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            errorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 8),
            errorView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -8)
        ])
    }
    
    func addExtraConfiguration() {
        view.backgroundColor = .systemBackground
    }
}

extension MovieDetailViewController: MovieDetailPresenterOutput {
    func showMovieDetails(_ movieDetail: MovieDetail) {
        DispatchQueue.main.async { [weak self] in
            self?.movieDetailView.configure(with: movieDetail)
            self?.movieDetailView.isHidden = false
        }
    }
    
    func setLoading(isActive: Bool) {
        DispatchQueue.main.async { [weak self] in
            isActive ? self?.loadingView.startAnimating() : self?.loadingView.stopAnimating()
        }
    }
    
    func setError(isActive: Bool) {
        DispatchQueue.main.async { [weak self] in
            self?.errorView.isHidden = !isActive
        }
    }
}
