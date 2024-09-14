//
//  UserProfileDTO.swift
//  BluePrint
//
//  Created by Magdalena Kopec on 14/09/2024.
//

struct UserProfileDTO: Decodable {
    let country: String
    let displayName: String
    let images: [UserProfileImageDTO]
}

struct UserProfileImageDTO: Decodable {
    let url: String
}
