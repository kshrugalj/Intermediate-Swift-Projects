//
//  StoreItem.swift
//  iTunesSearch
//
//  Created by Kshrugal Reddy Jangalapalli on 11/17/24.
//
import Foundation

struct SearchResponse: Codable {
    let results: [StoreItem]
}

struct StoreItem: Codable {
    let trackName:String
    let artistName:String
    let kind:String
    let description:String
    let artWorkURL:URL
    let releaseDate:String
    let primaryGenreName:String
    
    enum CodingKeys: String, CodingKey {
        case trackName
        case artistName
        case kind
        case description
        case artWorkURL = "artworkUrl100"
        case releaseDate
        case primaryGenreName
    }
    
    enum AdditionalKeys: String, CodingKey {
        case longDescription
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        trackName = try container.decode(String.self, forKey: CodingKeys.trackName)
        artistName = try container.decode(String.self, forKey: CodingKeys.artistName)
        releaseDate = try container.decode(String.self, forKey: CodingKeys.releaseDate)
        primaryGenreName = try container.decode(String.self, forKey: CodingKeys.primaryGenreName)
        kind = try container.decode(String.self, forKey: CodingKeys.kind)
        artWorkURL = try container.decode(URL.self, forKey:CodingKeys.artWorkURL)
        
        if let description = try? container.decode(String.self, forKey:CodingKeys.description) {
            self.description = description
        }else{
            let additionalValues = try decoder.container(keyedBy: AdditionalKeys.self)
            description = (try? additionalValues.decode(String.self, forKey: AdditionalKeys.longDescription)) ?? ""
        }
    }
}


