//
//  NetworkManager.swift
//  SpaceXApp
//
//  Created by Amit Rawal on 14/01/24.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://api.spacexdata.com/v3/"
    private let launchURL = baseURL + "launches"
    
    private init() {}
    
    
    func getLaunches() async throws -> [LaunchModel] {
        
        guard let url = URL(string: launchURL) else {
            throw APIError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([LaunchModel].self, from: data)
        } catch {
            print(error)
            print(error.localizedDescription)
            throw APIError.invalidData
        }
    }
    
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void ) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            guard let data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}
