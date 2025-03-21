//
//  Request.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 20/03/25.
//

import Foundation

protocol Request {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var headers: [String: String] { get }
    var body: Data? { get }
    var method: HTTPMethod { get }
    
    func urlRequest() -> URL?
}

enum HTTPMethod: String {
    case GET, POST, PUT, PATCH, DELETE
}

extension Request {
    func urlRequest() -> URLRequest? {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path
        
        guard let url = urlComponents.url else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpBody = body
        
        return urlRequest
        
    }
}
