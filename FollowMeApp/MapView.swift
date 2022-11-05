//
//  MapView.swift
//  FollowMeApp
//
//  Created by Abdallah Abu Samaha on 11/5/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    // this should become a function that should calculate my location
    static var myLocation = [40.83834587046632,14.254053016537693]
        
    // should become a function that will calulate the span
    static var mySpan = [0.05, 0.05]
    
    
    // this is the map region
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: myLocation[0],
            longitude: myLocation[1]),
        span: MKCoordinateSpan(
            latitudeDelta: mySpan[0],
            longitudeDelta: mySpan[1])
    )
    
    @State var user = UserLocation(userName: "Abdallah", latitude: 40.83859036140747, longitude: 14.24945566830365)
    
    
    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
