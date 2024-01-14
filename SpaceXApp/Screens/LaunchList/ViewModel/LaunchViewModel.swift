//
//  LaunchViewModel.swift
//  SpaceXApp
//
//  Created by Amit Rawal on 14/01/24.
//

import SwiftUI

@MainActor final class LaunchListViewModel: ObservableObject {
    
    @Published var launches: [LaunchModel] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedLaunch: LaunchModel?
    
    private let networkingService: NetworkingService

    //dependency injection
    init(networkingService: NetworkingService = NetworkManager.shared) {
        self.networkingService = networkingService
    }
    

    func getLaunches(completion: @escaping (Result<[LaunchModel], APIError>) -> Void) {
        isLoading = true
        Task {
            do {
                let arr: [LaunchModel] = try await networkingService.fetch(from: URLs.launchURL)
                launches = arr.reversed()
                isLoading = false
                completion(.success(launches))
            } catch {
                if let apError = error as? APIError {
                    switch apError {
                        case .invalidURL:
                            alertItem = AlertContext.invalidURL
                        case .invalidResponse:
                            alertItem = AlertContext.invalidResponse
                        case .invalidData:
                            alertItem = AlertContext.invalidData
                        case .unableToComplete:
                            alertItem = AlertContext.unableToComplete
                    }
                } else {
                    alertItem = AlertContext.invalidResponse
                }
                isLoading = false
                completion(.failure(error as? APIError ?? .invalidResponse))
            }
        }
    }
}
