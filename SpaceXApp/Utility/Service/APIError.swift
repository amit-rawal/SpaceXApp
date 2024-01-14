//
//  APError.swift
//  SpaceXApp
//
//  Created by Amit Rawal on 14/01/24.
//

import Foundation

//MARK: API errors
enum APIError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
