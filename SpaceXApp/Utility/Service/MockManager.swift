//
//  MockManager.swift
//  SpaceXApp
//
//  Created by Amit Rawal on 14/01/24.
//

import Foundation

//To Use Mock Data for Testing

final class MockManager : NetworkingService {
    
    static let shared = MockManager()
    
    var launchData: [LaunchModel]?
    
    private init() {
        launchData = loadDataFromFile("MOCK_DATA.json")
    }
    
    func fetch<T: Codable>(from urlString: String) async throws -> T {
        
        guard let _ = URL(string: urlString) else {
            throw APIError.invalidURL
        }
        
        let data: Data
        let filename = "MOCK_DATA.json"

        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
            else {
                fatalError("Couldn't find \(filename) in main bundle.")
        }

        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            throw APIError.invalidData
        }
    }
    
    func loadDataFromFile<T: Decodable>(_ filename: String) -> T {
        let data: Data

        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
            else {
                fatalError("Couldn't find \(filename) in main bundle.")
        }

        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
}
