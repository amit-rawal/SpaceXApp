//
//  NetworkManager.swift
//  SpaceXApp
//
//  Created by Amit Rawal on 14/01/24.
//

import UIKit

protocol NetworkingService {
    func fetch<T: Codable>(from urlString: String) async throws -> T
}

final class NetworkManager : NetworkingService {
    
    static let shared = NetworkManager()

    private init() {}
    
    //MARK: generic Fetch request
    func fetch<T: Codable>(from urlString: String) async throws -> T {
        
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            throw APIError.invalidData
        }
    }
}


