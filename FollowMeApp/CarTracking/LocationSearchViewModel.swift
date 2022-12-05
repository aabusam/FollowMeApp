//
//  LocationSearchViewModel.swift
//  FollowMeApp
//
//  Created by Abdallah Abu Samaha on 11/29/22.
//

import Foundation
import MapKit
import SwiftUI
import Firebase

class LocationSearchViewModel: NSObject, ObservableObject {
    
    // MARK: - Properties
    
    @Published var userLocation: CLLocationCoordinate2D?
    @Published var myId: String?
    @Published var userId: String?
    
    @Published var showProfileView: Bool = false
    @Published var showDirectionView:Bool = false
   
    
    //MARK: - Helpers
    
    
}

extension LocationSearchViewModel {
    
    func getUserLocation(userId: String) {
        // get the user's location from firestore
        let db = Firestore.firestore()
        let docRef = db.collection("Users").document(userId)

        docRef.getDocument { (document, error) in
            guard error == nil else {
                print("error", error ?? "")
                return
            }

            if let document = document, document.exists {
                let data = document.data()
                if let data = data {
                    self.userLocation = CLLocationCoordinate2D(
                        latitude: CLLocationDegrees(data["userLat"] as? Float ?? 0.0),
                        longitude: CLLocationDegrees(data["userLong"] as? Float ?? 0.0))
                    print(self.userLocation!)
                }
            }

        }
    }
    
    func sendCurrentLocation(location:MKUserLocation){
        // sends my location to the firestore
        self.myId = (Auth.auth().currentUser?.uid)!
        
            let db = Firestore.firestore()
            
        db.collection("Users").document(self.myId!).setData(["userLat": Float(location.coordinate.latitude),
                                                             "userLong":Float(location.coordinate.longitude)],
                                                              merge: true) { [self] (err) in
            if err != nil{
                
                print((err?.localizedDescription)!)
                return
            }
        }
    }
    
  
}
