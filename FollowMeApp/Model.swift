//
//  Model.swift
//  FollowMeApp
//
//  Created by Abdallah Abu Samaha on 11/3/22.
//

import Foundation
import MapKit

struct UserLocation: Identifiable {
    
    let userName:String
    let id = UUID() // Should become the ID from firebase
    let latitude : Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude) // turns the latitude and longitude into a coordinate
    }
}

