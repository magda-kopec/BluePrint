//
//  FetchUserProfileUseCaseImpl.swift
//  BluePrint
//
//  Created by Magdalena Kopec on 08/09/2024.
//

import Foundation

final class FetchUserProfileUseCaseImpl: FetchUserProfileUseCase {
    
    private let repository: UserProfileRepository
    
    init(repository: UserProfileRepository) {
        self.repository = repository
    }
    
    func execute() async throws -> UserProfile {
        try await repository.getUser()
    }
}
