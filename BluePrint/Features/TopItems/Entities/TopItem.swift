//
//  TopItems.swift
//  BluePrint
//
//  Created by Magdalena Kopec on 08/09/2024.
//

struct TopItem {
    let type: TopItemType
    let name: String
    let imageUrlString: String
}

enum TopItemType{
    case artists
    case tracks
}
