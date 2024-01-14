//
//  APError.swift
//  SpaceXApp
//
//  Created by Amit Rawal on 14/01/24.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
