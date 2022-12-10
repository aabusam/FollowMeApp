//
//  FollowAppApp.swift
//  FollowApp
//
//  Created by Abdallah Abu Samaha on 11/3/22.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct FollowAppApp: App {
    @StateObject var locationSearchViewModel = LocationSearchViewModel()
    // register app delegate for Firebase setup
     @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(locationSearchViewModel)
        }
    }
}
