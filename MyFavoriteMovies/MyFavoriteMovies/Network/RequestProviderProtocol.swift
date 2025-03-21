//
//  RequestProvider.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 20/03/25.
//

import Foundation

protocol RequestProviderProtocol {
    func make<T: Decodable>(_ request: Request, completion: @escaping (Result<T?, RequestError>) -> Void)
}

class RequestProvider: RequestProviderProtocol {
    func make<T: Decodable>(_ request: Request, completion: @escaping (Result<T?, RequestError>) -> Void) {
        guard let urlRequest = request.urlRequest() else {
            completion(.failure(.invalidURL))
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            if let error = error {
                completion(.failure(.connectionFailed))
                return
            }
            
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(.decodingFailed))
                }
                return
            }
            
            completion(.success(nil))
        }
        
        dataTask.resume()
    }
}
