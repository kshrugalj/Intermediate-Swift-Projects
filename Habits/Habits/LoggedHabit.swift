//
//  LoggedHabit.swift
//  Habits
//
//  Created by Kshrugal Reddy Jangalapalli on 12/5/24.
//
import Foundation

struct LoggedHabit {
    let userID: String
    let habitName: String
    let timestamp: Date
}

extension LoggedHabit: Codable { }
