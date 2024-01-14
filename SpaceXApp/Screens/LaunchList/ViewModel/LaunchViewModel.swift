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
    
    
    func getLaunches() {
        isLoading = true
        Task {
            do {
                let arr: [LaunchModel] = try await NetworkManager.shared.fetch(from: URLs.launchURL)
                launches = arr.reversed()
                isLoading = false
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
            }
        }
    }
}
