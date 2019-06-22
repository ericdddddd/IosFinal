//
//  RestaurantFIR.swift
//  IosFinal
//
//  Created by User18 on 2019/6/15.
//  Copyright © 2019 ibob. All rights reserved.
//

import Foundation
import Firebase

struct RestaurantFIR {
    let key: String
    let name: String
    let type: String
    let location: String
    let longitude: Double
    let latitude: Double
    let ref: DatabaseReference?
    init(name: String, type: String, location: String, longitude:Double,latitude:Double,key: String = "") {
        self.key = key
        self.name = name
        self.type = type
        self.location = location
        self.longitude = longitude
        self.latitude = latitude
        self.ref = nil
    }
    init(snapshot: DataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        name = snapshotValue["name"] as! String
        type = snapshotValue["type"] as! String
        location = snapshotValue["location"] as! String
        longitude = snapshotValue["longitude"] as! Double
        latitude = snapshotValue["latitude"] as! Double
        ref = snapshot.ref
    }
    func toAnyObject() -> Any {
        return [
            "name": name,
            "type": type,
            "location": location,
            "longitude": longitude,
            "latitude": latitude
        ]
    }
  /*  private func uploadDataToFirebase(restaurant:Restaurant) {
        let restaurantItem = RestaurantFIR(name: restaurant.name, type: restaurant.type,location: restaurant.location, longitude:restaurant.longitude,latitude:restaurant.latitude)
        
        let restaurantItemRef =
           // self.ref.child((restaurant.name!))
        
        restaurantItemRef.setValue(restaurantItem.toAnyObject(), withCompletionBlock: { (error, ref) in
            if error == nil {
                let alertController = UIAlertController(title: "Success", message: "Upload Successfully", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
        })
    }*/
}
