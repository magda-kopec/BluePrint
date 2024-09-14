//
//  CountryCodeFormatter.swift
//  BluePrint
//
//  Created by Magdalena Kopec on 14/09/2024.
//

import Foundation

struct CountryCodeFormatter {
    static func countryName(from countryCode: String) -> String {
        let locale = Locale.current
        return locale.localizedString(forRegionCode: countryCode) ?? countryCode
    }
}
