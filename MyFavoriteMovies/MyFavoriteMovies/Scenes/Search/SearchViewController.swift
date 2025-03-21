//
//  SearchViewController.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 20/03/25.
//

import UIKit

class SearchViewController: UIViewController {
    
    private lazy var searchStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [searchBar, searchButton])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 2
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Find your favorite movie..."
        searchBar.searchTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        searchBar.searchBarStyle = .minimal
        searchBar.delegate = self
        return searchBar
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Search", for: .normal)
        button.addTarget(self, action: #selector(searchButtonWasTapped), for: .touchUpInside)
        return button
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
    
    let presenter: SearchPresenterInput
    
    init(presenter: SearchPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    @objc private func searchButtonWasTapped() {
        presenter.search(term: searchBar.text)
    }
}

extension SearchViewController: ViewCode {
    func addSubviews() {
        view.addSubview(searchStackView)
        view.addSubview(loadingView)
        view.addSubview(errorView)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            searchStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            searchStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            
            loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            errorView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            errorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 8),
            errorView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -8)
        ])
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchButtonWasTapped()
    }
}

extension SearchViewController: SearchPresenterOutput {
    func setLoading(isActive: Bool) {
        DispatchQueue.main.async {
            isActive ? self.loadingView.startAnimating() : self.loadingView.stopAnimating()
        }
    }
    
    func setError(isActive: Bool) {
        DispatchQueue.main.async {
            self.errorView.isHidden = !isActive
        }
    }
    
    func showEmptyTermAlert() {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Empty Term", message: "Please enter a search term.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true)
        }
    }
}
