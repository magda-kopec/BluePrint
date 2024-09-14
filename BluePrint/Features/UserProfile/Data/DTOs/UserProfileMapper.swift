//
//  UserProfileMapper.swift
//  BluePrint
//
//  Created by Magdalena Kopec on 14/09/2024.
//

struct UserProfileMapper {
    typealias Input = UserProfileDTO
    typealias Output = UserProfile
    
    static func map(_ input: Input) -> Output {
        let countryCode = input.country
        let country = CountryCodeFormatter.countryName(from: countryCode)
        return Output(displayName: input.displayName, profileImageUrlString: input.images.first?.url, country: country)
    }
}
