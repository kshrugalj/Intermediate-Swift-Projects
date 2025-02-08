import Foundation

struct Emoji: Codable {
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
     static let archiveURL: URL = {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent("emojis").appendingPathExtension("plist")
    }()

     static func saveToFile(_ emojis: [Emoji]){
        let encoder = PropertyListEncoder()
           do {
               let data = try encoder.encode(emojis)
               try data.write(to: archiveURL)
           } catch {
               print("Error saving emojis: \(error)")
           }
    }
    
    static func loadFromFile() -> [Emoji]? {
        guard let data = try? Data(contentsOf: archiveURL) else { return nil }
        let decoder = PropertyListDecoder()
        return try? decoder.decode([Emoji].self, from: data)
    }

    static func sampleEmojis() -> [Emoji] {
        return [
            Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness"),
            Emoji(symbol: "😇", name: "Smiling Face with Halo", description: "A smiling face with a halo above it.", usage: "innocence"),
            Emoji(symbol: "🥲", name: "Smiling Face with Tear", description: "A smiling face with a single tear.", usage: "bittersweet"),
            Emoji(symbol: "😎", name: "Cool Face", description: "A smiling face with sunglasses.", usage: "cool"),
            Emoji(symbol: "🥳", name: "Partying Face", description: "A face wearing a party hat, blowing a party horn.", usage: "celebration"),
           
        ]
    }

}
