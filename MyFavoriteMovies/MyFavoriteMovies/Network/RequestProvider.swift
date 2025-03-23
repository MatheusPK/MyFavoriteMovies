//
//  RequestProvider.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 20/03/25.
//

import Foundation

protocol RequestProviderProtocol {
    func make<T: Decodable>(_ request: Request, completion: @escaping (Result<T?, RequestError>) -> Void)
    func fetchData(_ request: Request, completion: @escaping (Result<Data, RequestError>) -> Void)
}

class RequestProvider: RequestProviderProtocol {
    
    func fetchData(_ request: Request, completion: @escaping (Result<Data, RequestError>) -> Void) {
        guard let urlRequest = request.urlRequest() else {
            completion(.failure(.invalidURL))
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(.requestError(error)))
                return
            }
            
            if let httpURLResponse = response as? HTTPURLResponse, !(200...299).contains(httpURLResponse.statusCode) {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidResponse))
                return
            }
            
            completion(.success(data))
        }
        
        dataTask.resume()
    }
    
    func make<T: Decodable>(_ request: Request, completion: @escaping (Result<T?, RequestError>) -> Void) {
        fetchData(request) { result in
            switch result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(.decodingFailed))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
