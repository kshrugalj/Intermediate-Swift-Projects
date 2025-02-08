//
//  Category.swift
//  Habits
//
//  Created by Kshrugal Reddy Jangalapalli on 12/5/24.
//
struct Category {
    let name: String
    let color: Color
}

extension Category: Codable { }

extension Category: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }

    static func == (lhs: Category, rhs: Category) -> Bool {
        return lhs.name == rhs.name
    }
}

