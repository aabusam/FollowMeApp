//
//  FollowMeMapViewRepresentable.swift
//  FollowMeApp
//
//  Created by Abdallah Abu Samaha on 11/5/22.
//

import Foundation
import SwiftUI
import MapKit

struct FollowMeMapViewRepresentable: UIViewRepresentable{
    
    let mapView = MKMapView()
    let locationManager = LocationManager()
    
    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator // the context objects gives us acces to the coordinator
        mapView.isRotateEnabled = true
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeCoordinator() -> MapCoordinator {
        // is the middle man between the swiftUI View and the UIKit functionality
        return MapCoordinator(parent: self)
    }
    
}

extension FollowMeMapViewRepresentable{
    
    class MapCoordinator: NSObject, MKMapViewDelegate {
        let parent: FollowMeMapViewRepresentable
        
        init(parent: FollowMeMapViewRepresentable){
            self.parent = parent
            super.init()
        }
        
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            let region = MKCoordinateRegion(
                    center: CLLocationCoordinate2D(
                        latitude: userLocation.coordinate.latitude,
                        longitude: userLocation.coordinate.longitude),
                    span: MKCoordinateSpan(
                        latitudeDelta: 0.05,
                        longitudeDelta: 0.05))
            
            parent.mapView.setRegion(region, animated: true)
        }
        
    }
}
