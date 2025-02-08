//
//  Color.swift
//  Habits
//
//  Created by Kshrugal Reddy Jangalapalli on 12/5/24.
//
import UIKit

struct Color {
    let hue: Double
    let saturation: Double
    let brightness: Double
} 

extension Color: Codable {
    enum CodingKeys: String, CodingKey {
        case hue = "h"
        case saturation = "s"
        case brightness = "b"
    }
}

extension Color: Hashable { }

extension Color {
    var uiColor: UIColor {
        return UIColor(hue: CGFloat(hue), saturation: CGFloat(saturation), brightness: CGFloat(brightness), alpha: 1)
    }
}
