//
//  MapView.swift
//  FollowMeApp
//
//  Created by Abdallah Abu Samaha on 11/26/22.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapViewRepresentable: UIViewRepresentable{
    
    let mapView = MKMapView()
    let locationManger =  LocationManger()
    
    @EnvironmentObject var locationSearchViewModel: LocationSearchViewModel
    
    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
        if let coordinate = locationSearchViewModel.userLocation {
            
            context.coordinator.addAndSelectAnnotation(withCoordinate: coordinate)
            context.coordinator.configurePolyline(withDestinationCoordinate: coordinate)
        }
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
    
}

//MARK: - MapCoordinator

extension MapViewRepresentable {
    
    class MapCoordinator: NSObject, MKMapViewDelegate{
        let parent: MapViewRepresentable
        var userLocation: CLLocationCoordinate2D?
        init(parent: MapViewRepresentable){
            self.parent = parent
            super.init()
        }
        
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            self.userLocation = userLocation.coordinate
            let region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(
                    latitude: userLocation.coordinate.latitude,
                    longitude: userLocation.coordinate.longitude),
                span: MKCoordinateSpan(
                    latitudeDelta: 0.05,
                    longitudeDelta: 0.05))
            parent.mapView.setRegion(region, animated: true)
            parent.locationSearchViewModel.sendCurrentLocation(location: userLocation)
            
        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let polyline = MKPolylineRenderer(overlay: overlay)
            polyline.strokeColor = .systemRed
            polyline.lineWidth = 6
            return polyline
        }
        
        func addAndSelectAnnotation(withCoordinate coordinate: CLLocationCoordinate2D){
            parent.mapView.removeAnnotations(parent.mapView.annotations)
            let anno = MKPointAnnotation()
            anno.coordinate = coordinate
            parent.mapView.addAnnotation(anno)
            parent.mapView.selectAnnotation(anno, animated: true)
            parent.mapView.showAnnotations(parent.mapView.annotations, animated: true)
            
        }
        
        func configurePolyline(withDestinationCoordinate coordinate: CLLocationCoordinate2D){
            guard let userLocationCoordinate = self.userLocation else {return}
            guard let destinationCoordinate = parent.locationSearchViewModel.userLocation else {return}
                    
            getDestinationRoute(from: userLocationCoordinate,
                                to: destinationCoordinate) { route in
                
                self.parent.mapView.addOverlay(route.polyline)
            }
        }
        
        func getDestinationRoute(from userLocation: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D, completion: @escaping (MKRoute) -> Void){
            
            let userPlaceMark = MKPlacemark(coordinate: userLocation)
            let destPlaceMark = MKPlacemark(coordinate: destination)
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: userPlaceMark)
            request.destination = MKMapItem(placemark: destPlaceMark)
            let directions = MKDirections(request: request)
            directions.calculate { response, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                guard let route = response?.routes.first else {return}
                completion(route)
            }
        }
        
        
        
    }
}

