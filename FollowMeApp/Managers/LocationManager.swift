//
//  LocationManager.swift
//  FollowMeApp
//
//  Created by Abdallah Abu Samaha on 11/5/22.
//

/*
 
 the purpose of this manager is just to request the user location,
 any updates on the user location will be handled else where

 */

import CoreLocation

class LocationManager: NSObject, ObservableObject{
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // gives us the most accurate possible location of our user
        locationManager.requestWhenInUseAuthorization() // this is the function that the app calls requests the location permissions
        locationManager.startUpdatingLocation() // will update the user location
    }
}

extension LocationManager: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard !locations.isEmpty else{return}
        locationManager.stopUpdatingLocation()
    }
    
}
