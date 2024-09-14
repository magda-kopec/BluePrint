//
//  UserProfileViewModel.swift
//  BluePrint
//
//  Created by Magdalena Kopec on 08/09/2024.
//

import Foundation

final class UserProfileViewModel: ObservableObject {
    
    @Published var userName: String?
    @Published var country: String?
    @Published var imageURL: URL?

    
    private let getUserProfileUseCase: FetchUserProfileUseCase
    
    init(getUserProfileUseCase: FetchUserProfileUseCase) {
        self.getUserProfileUseCase = getUserProfileUseCase
    }
    
    @MainActor
    func loadData() async {
        do {
            let user = try await getUserProfileUseCase.execute()
            userName = user.displayName
            country = user.country
            imageURL = URL(string: user.profileImageUrlString ?? "")
        } catch let error {
            // TODO: - handle error
            print(error)
        }
    }
}
