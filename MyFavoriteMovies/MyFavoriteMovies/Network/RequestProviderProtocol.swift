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
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(.requestError))
                return
            }
            
            if let httpURLResponse = response as? HTTPURLResponse, !(200...299).contains(httpURLResponse.statusCode) {
                completion(.failure(.invalidResponse))
                return
            }
            
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    print(error)
                    completion(.failure(.decodingFailed))
                }
                return
            }
            
            completion(.success(nil))
        }
        
        dataTask.resume()
    }
}
