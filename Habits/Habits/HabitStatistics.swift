//
//  HabitStatistics.swift
//  Habits
//
//  Created by Kshrugal Reddy Jangalapalli on 12/6/24.
//
struct HabitStatistics {
    let habit: Habit
    let userCounts: [UserCount]
}

extension HabitStatistics: Codable { }

