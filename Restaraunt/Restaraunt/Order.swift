//
//  Order.swift
//  Restaraunt
//
//  Created by Kshrugal Reddy Jangalapalli on 11/16/24.
//
struct Order: Codable {
    var menuItems: [MenuItem]

    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
