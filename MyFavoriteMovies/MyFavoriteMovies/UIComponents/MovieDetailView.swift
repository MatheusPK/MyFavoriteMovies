//
//  MovieDetailView.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 23/03/25.
//

import UIKit

class MovieDetailView: UIView {
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var backdropImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var overviewLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var voteAverageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with movie: MovieDetail) {
        if let backdropPath = movie.backdropPath {
            backdropImageView.setImage(from: MoviesRequest.image(path: backdropPath), placeholder: UIImage(systemName: "movieclapper"))
        }
                                       
        titleLabel.text = movie.title
        overviewLabel.text = movie.overview
        releaseDateLabel.text = "Release Date: " + (movie.releaseDate ?? "N/A")
        voteAverageLabel.text = "⭐ \(movie.voteAverage ?? 0)"
    }
}

extension MovieDetailView: ViewCode {
    func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(backdropImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(overviewLabel)
        contentView.addSubview(releaseDateLabel)
        contentView.addSubview(voteAverageLabel)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            backdropImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backdropImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backdropImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backdropImageView.heightAnchor.constraint(equalToConstant: 200),
            
            titleLabel.topAnchor.constraint(equalTo: backdropImageView.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            overviewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            overviewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            overviewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            releaseDateLabel.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 8),
            releaseDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            releaseDateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            voteAverageLabel.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 8),
            voteAverageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            voteAverageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            voteAverageLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}
