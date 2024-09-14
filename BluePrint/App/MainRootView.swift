//
//  MainRootView.swift
//  BluePrint
//
//  Created by Magdalena Kopec on 08/09/2024.
//

import Foundation
import SwiftUI

struct MainRootView: View {
    
    // TODO: - APP-0001 - create dependency injection in decent form
    private let userProfileViewModel = UserProfileViewModel(
        getUserProfileUseCase: FetchUserProfileUseCaseImpl(
            repository:
                UserProfileRepositoryImpl(
                networkingService: NetworkingServiceImpl()
            )//MockUserProfileRepository()
        )
    )
    
    var body: some View {
        TabView {
            UserProfileView(viewModel: userProfileViewModel)
                .tabItem {
                    Label("User", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainRootView()
}
