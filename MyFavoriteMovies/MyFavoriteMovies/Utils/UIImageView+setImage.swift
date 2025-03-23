//
//  UIImageView+setImage.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 22/03/25.
//

import UIKit

class ImageCache {
    static var storage: [String : UIImage] = [:]
}

extension UIImageView {
    func setImage(from request: Request, placeholder: UIImage? = nil) {
        guard image == nil else { return }
        
        self.image = placeholder
        
        let cacheKey = request.urlRequest()?.url?.absoluteString
        
        if let cacheKey = cacheKey, let cachedImage = ImageCache.storage[cacheKey] {
            self.image = cachedImage
            return
        }

        DispatchQueue.global(qos: .background).async { [weak self] in
            let requestProvider = RequestProvider()
            
            requestProvider.fetchData(request) { result in
                switch result {
                case .success(let data):
                    if let image = UIImage(data: data), let cacheKey = cacheKey {
                        ImageCache.storage[cacheKey] = image
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                    }
                case .failure(_):
                    return
                }
            }
        }
    }
}
