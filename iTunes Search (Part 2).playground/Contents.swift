import UIKit
import Foundation

extension Data {
    func prettyPrintedJSONString() {
        guard
            let jsonObject = try? JSONSerialization.jsonObject(with: self, options: []),
            let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted]),
            let prettyJSONString = String(data: jsonData, encoding: .utf8) else {
                print("Failed to read JSON Object.")
                return
        }
        print(prettyJSONString)
    }
}

struct StoreItem: Codable {
    let trackName: String
    let trackArtist: String
    let kind: String
    let description: String
    let artworkURL: URL
    let releaseDate: String
    let primaryGenreName: String
    
    enum CodingKeys: String, CodingKey {
        case trackName
        case trackArtist
        case kind
        case description
        case artworkURL = "artworkUrl100"
        case releaseDate
        case primaryGenreName
    }
    
    enum AdditionalKeys: String, CodingKey {
        case longDescription
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        trackName = try values.decode(String.self, forKey: CodingKeys.trackName)
        trackArtist = try values.decode(String.self, forKey: CodingKeys.trackArtist)
        kind = try values.decode(String.self, forKey: CodingKeys.kind)
        artworkURL = try values.decode(URL.self, forKey: CodingKeys.artworkURL)
        releaseDate = try values.decode(String.self, forKey: CodingKeys.releaseDate)
        primaryGenreName = try values.decode(String.self, forKey: CodingKeys.primaryGenreName)

        if let description = try? values.decode(String.self, forKey: CodingKeys.description) {
            self.description = description
        } else {
            let additionalValues = try decoder.container(keyedBy: AdditionalKeys.self)
            description = (try? additionalValues.decode(String.self, forKey: AdditionalKeys.longDescription)) ?? ""
        }
    }
}

struct SearchResponse: Codable {
    let results: [StoreItem]
}

enum StoreItemError: Error, LocalizedError {
    case itemsNotFound
}

func fetchItems(matching query: [String: String]) async throws -> [StoreItem] {
    var urlComponents = URLComponents(string: "https://itunes.apple.com/search")!
    urlComponents.queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value) }
    
    let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
    
    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        throw StoreItemError.itemsNotFound
    }
    
    let decoder = JSONDecoder()
    let searchResponse = try decoder.decode(SearchResponse.self, from: data)

    return searchResponse.results
}

let query:[String:String] = [
    "term": "Polo G",
    "media": "music",
    "limit": "10"
]

Task {
    do {
        let storeItems = try await fetchItems(matching: query)
        storeItems.forEach { item in
            print("""
            Name: \(item.trackName)
            Artist: \(item.trackArtist)
            Kind: \(item.kind)
            Description: \(item.description)
            Artwork URL: \(item.artworkURL)


            """)
        }
    } catch {
        print(error)
    }
}
