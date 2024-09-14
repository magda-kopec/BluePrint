//
//  UserProfileRepository.swift
//  BluePrint
//
//  Created by Magdalena Kopec on 08/09/2024.
//

import Foundation

protocol UserProfileRepository {
    func getUser() async throws -> UserProfile
}
