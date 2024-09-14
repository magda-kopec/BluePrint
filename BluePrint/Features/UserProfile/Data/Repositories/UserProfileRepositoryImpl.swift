//
//  UserProfileRepositoryImpl.swift
//  BluePrint
//
//  Created by Magdalena Kopec on 13/09/2024.
//

import Foundation

final class UserProfileRepositoryImpl: UserProfileRepository {

    private let networkingService: NetworkingService
    
    init(networkingService: NetworkingService) {
        self.networkingService = networkingService
    }
    
    func getUser() async throws -> UserProfile {
        let url = URL(string: "https://api.spotify.com/v1/me")!
        let userDTO: UserProfileDTO = try await networkingService.request(url: url, method: .GET, params: nil)
        return UserProfileMapper.map(userDTO)
    }
}
