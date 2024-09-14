//
//  MockUserProfileRepository.swift
//  BluePrint
//
//  Created by Magdalena Kopec on 08/09/2024.
//

import Foundation

final class MockUserProfileRepository: UserProfileRepository {
    func getUser() async throws -> UserProfile {
        try await Task.sleep(nanoseconds: 1_000_000_000)
        return UserProfile(
            displayName: "McPusz",
            profileImageUrlString: "https://images.pexels.com/photos/8167787/pexels-photo-8167787.jpeg?auto=compress&cs=tinysrgb&w=600",
            country: "Poland"
        )
    }
    
}
