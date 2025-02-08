//
//  MenuItem.swift
//  Restaraunt
//
//  Created by Kshrugal Reddy Jangalapalli on 11/16/24.
//
import Foundation

// MARK: - Welcome


// MARK: - Item
struct MenuItem: Codable {
    let description: String
    let price: Double
    let id: Int
    let category: String
    let imageURL: URL
    let name: String

    enum CodingKeys: String, CodingKey {
        case description, price, id, category
        case imageURL = "image_url"
        case name
    }
}

struct MenuItems: Codable {
    let items: [MenuItem]
}
