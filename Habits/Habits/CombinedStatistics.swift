//
//  CombinedStatistics.swift
//  Habits
//
//  Created by Kshrugal Reddy Jangalapalli on 12/6/24.
//
struct CombinedStatistics {
    let userStatistics: [UserStatistics]
    let habitStatistics: [HabitStatistics]
}

extension CombinedStatistics: Codable { }

