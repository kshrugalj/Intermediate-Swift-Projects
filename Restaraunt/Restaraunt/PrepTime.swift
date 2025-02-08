//
//  PrepTime.swift
//  Restaraunt
//
//  Created by Kshrugal Reddy Jangalapalli on 11/16/24.
//
struct PreparationTime:Codable{
    let prepTime:Int
    
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
}
