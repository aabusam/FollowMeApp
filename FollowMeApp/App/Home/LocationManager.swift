//
//  LocationManager.swift
//  FollowMeApp
//
//  Created by Abdallah Abu Samaha on 11/28/22.
//

import Foundation
import CoreLocation

class LocationManger: NSObject, ObservableObject {
    
    private let locationManger = CLLocationManager()
    
    override init(){
        super.init()
        locationManger.delegate = self
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        locationManger.requestWhenInUseAuthorization()
        locationManger.startUpdatingLocation()
    }
    
}

extension LocationManger: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard !locations.isEmpty else {return}
        locationManger.stopUpdatingLocation()
        
    }
}
