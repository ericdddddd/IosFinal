//
//  Restaurant.swift
//  IosFinal
//
//  Created by User10 on 2019/6/13.
//  Copyright © 2019 ibob. All rights reserved.
//

import Foundation

class Restaurant :Codable {
    var name :String
    var type :String
    var location :String
    var phone :String
    var image :String
    var longitude : Double
    var latitude :Double
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    init(name: String, type: String, location: String, phone: String, image: String,
         longitude:Double,latitude:Double) {
        self.name = name
        self.type = type
        self.location = location
        self.phone = phone
        self.image = image
        self.longitude = longitude
        self.latitude = latitude
    }
    static func saveToFile(restaurants: [Restaurant]) {
        let propertyEncoder = PropertyListEncoder()
        if let data = try? propertyEncoder.encode(restaurants) {
            let url = Restaurant.documentsDirectory.appendingPathComponent("restaurant").appendingPathExtension("plist")
            try? data.write(to: url)
        }
    }
    
    static func readLoversFromFile() -> [Restaurant]? {
        let propertyDecoder = PropertyListDecoder()
        let url = Restaurant.documentsDirectory.appendingPathComponent("restaurant").appendingPathExtension("plist")
        if let data = try? Data(contentsOf: url), let restaurants = try? propertyDecoder.decode([Restaurant].self, from: data) {
            return restaurants
        } else {
            return nil
        }
    }
}
