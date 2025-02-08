import UIKit
import Foundation

let query : [String:String]=[
    "term":"Polo G",
    "media":"music",
    "limit":"10"
]

let baseURL = "https://itunes.apple.com/search"

var fullURL = URLComponents(string: baseURL)
fullURL?.queryItems = query.map{URLQueryItem(name: $0.key, value: $0.value)}

Task{
    if let url = fullURL?.url {
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            let resultString = String(data: data, encoding: .utf8)
            print("Here are the results \(resultString ?? "There has been an error").")
        } catch {
            print("There has been an error \(error).")
        }
    }
}

