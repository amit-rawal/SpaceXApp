//
//  NetworkManager.swift
//  SpaceXApp
//
//  Created by Amit Rawal on 14/01/24.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()

    private init() {}
    
    //To get Launch data from internet
    func getLaunches() async throws -> [LaunchModel] {
        
        guard let url = URL(string: URLs.launchURL) else {
            throw APIError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([LaunchModel].self, from: data)
        } catch {
            throw APIError.invalidData
        }
    }
}
