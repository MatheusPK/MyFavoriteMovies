//
//  MovieCell.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 21/03/25.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [poster, movieTitle, rating, heartButton])
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var poster: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 4
        imageView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        return imageView
    }()
    
    private lazy var movieTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 2
        label.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        return label
    }()
    
    private lazy var rating: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .white
        label.numberOfLines = 1
        label.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        return label
    }()
    
    private lazy var heartButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .red
        button.addTarget(self, action: #selector(heartButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private var didTapHeartButton: (() -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with movie: Movie, isFavorite: Bool, didTapHeartButton: @escaping () -> ()) {
        poster.setImage(from: MoviesRequest.image(path: movie.posterPath ?? ""), placeholder: UIImage(systemName: "movieclapper"))
        movieTitle.text = movie.originalTitle
        rating.text = String(format: "Rating: %.1f/10", movie.voteAverage ?? 0)
        heartButton.imageView?.image = isFavorite ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        self.didTapHeartButton = didTapHeartButton
    }
    
    @objc private func heartButtonTapped() {
        didTapHeartButton?()
    }
}

extension MovieCell: ViewCode {
    func addSubviews() {
        contentView.addSubview(mainStackView)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2),
            poster.heightAnchor.constraint(lessThanOrEqualTo: poster.widthAnchor, multiplier: 1.5),
            heartButton.widthAnchor.constraint(equalToConstant: 30),
            heartButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func addExtraConfiguration() {
        contentView.backgroundColor = .darkGray
        contentView.layer.cornerRadius = 8
    }
}
