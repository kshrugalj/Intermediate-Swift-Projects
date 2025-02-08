//
//  SearchScope.swift
//  iTunesSearch
//
//  Created by Kshrugal Reddy Jangalapalli on 12/4/24.
//
enum SearchScope: CaseIterable {
    case all, movies, music, apps, books
    
    var title: String {
        switch self {
        case .all: return "All"
        case .movies: return "Movies"
        case .music: return "Music"
        case .apps: return "Apps"
        case .books: return "Books"
        }
    }
    
    var mediaType: String {
        switch self {
        case .all: return "all"
        case .movies: return "movie"
        case .music: return "music"
        case .apps: return "software"
        case .books: return "ebook"
        }
    }
}

