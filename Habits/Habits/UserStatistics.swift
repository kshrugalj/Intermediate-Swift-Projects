//
//  UserStatistics.swift
//  Habits
//
//  Created by Kshrugal Reddy Jangalapalli on 12/6/24.
//
struct UserStatistics {
    let user: User
    let habitCounts: [HabitCount]
}

extension UserStatistics: Codable { }
