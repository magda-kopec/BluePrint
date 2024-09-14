//
//  TopItemsRepository.swift
//  BluePrint
//
//  Created by Magdalena Kopec on 08/09/2024.
//

import Foundation

protocol TopItemsRepository {
    func getTopItems() async -> [TopItem]
}
