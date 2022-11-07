//
//  File.swift
//  FollowMeApp
//
//  Created by Abdallah Abu Samaha on 11/6/22.
//

import SwiftUI
import Firebase
import LocalAuthentication

class LoginViewModel: ObservableObject{
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    //MARK: FaceID Properties
    @AppStorage("use_face_id") var useFaceID:Bool = false
    @AppStorage("use_face_email") var FaceIDEmail:String = ""
    @AppStorage("use_face_password") var FaceIDPassword:String = ""
    
    // Log Status
    @AppStorage("log_status") var logStatus: Bool = false
    
    //MARK: Error
    @Published var showError: Bool = false
    @Published var errorMsg: String = ""
    
    //MARK: Firebase Login
    func loginUser(useFaceID: Bool, email:String = "", password:String = "")async throws{
        
        let _ = try await Auth.auth().signIn(withEmail: email != "" ?  email : self.email, password: password != "" ? password : self.password)
        
        DispatchQueue.main.async {
            //storing once
            if useFaceID && self.FaceIDEmail == "" {
                
                //MARK: Storing for future ID Login
                self.useFaceID = useFaceID
                self.FaceIDEmail = self.email
                self.FaceIDPassword = self.password
            }
            
            self.logStatus = true
        }
        
    }
    
    //MARK: FaceID usage
    func getBioMetricStatus()->Bool{
        let scanner  = LAContext()
        return scanner.canEvaluatePolicy(.deviceOwnerAuthentication, error: .none)
    }
    
    //MARK: FaceID login
    func authenticationUser()async throws{
        
        let status = try await LAContext().evaluatePolicy(.deviceOwnerAuthentication,localizedReason: "To Login Into App")
    
        if status{
            try await loginUser(useFaceID: useFaceID, email: self.FaceIDEmail, password: self.FaceIDPassword)
        }
        
    }
    
}
