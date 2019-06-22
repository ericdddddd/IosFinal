//
//  RestaurantDetailsViewController.swift
//  IosFinal
//
//  Created by User10 on 2019/6/13.
//  Copyright © 2019 ibob. All rights reserved.
//

import UIKit
import GoogleMaps
class RestaurantDetailsViewController: UIViewController {

    @IBOutlet weak var nameField: UILabel!
    @IBOutlet weak var phoneField: UILabel!
    @IBOutlet weak var locationField: UILabel!
    @IBOutlet weak var mapView: GMSMapView!
    var restaurant: Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.text = restaurant.name
        phoneField.text = restaurant.phone
        locationField.text = restaurant.location
        let longitudeValue = restaurant.longitude
        let latitudeValue = restaurant.latitude
        // Do any additional setup after loading the view.
        let camera = GMSCameraPosition.camera(withLatitude: latitudeValue, longitude: longitudeValue, zoom: 15.0)
        let position = CLLocationCoordinate2D(latitude: latitudeValue, longitude: longitudeValue)
        let marker = GMSMarker(position: position)
        marker.title = restaurant.name
        marker.map = mapView
        mapView.camera = camera
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
