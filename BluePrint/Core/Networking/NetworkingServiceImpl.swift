//
//  NetworkingServiceImpl.swift
//  BluePrint
//
//  Created by Magdalena Kopec on 13/09/2024.
//

import Foundation

struct NetworkingServiceImpl: NetworkingService {
    func request<T>(url: URL, method: HTTPMethod, params: [String: Any]?) async throws -> T where T : Decodable {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        if let params {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params)
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
       // TODO: - APP-0002 - add login - provide temp token from postman for now
        let token: String? = ""
                if let token = token {
                    urlRequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
                }
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
            throw NetworkError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingError(error)
        }
    }
}

enum NetworkError: Error {
    case invalidResponse
    case decodingError(Error)
}
