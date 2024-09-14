//
//  NetworkingService.swift
//  BluePrint
//
//  Created by Magdalena Kopec on 13/09/2024.
//
import Foundation

protocol NetworkingService {
    func request<T: Decodable>(url: URL, method: HTTPMethod, params: [String: Any]?) async throws -> T
}
