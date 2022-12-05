//
//  SignUpViewModel.swift
//  FollowMeApp
//
//  Created by Abdallah Abu Samaha on 11/7/22.
//

import SwiftUI
import Firebase


class SignUPViewModel: ObservableObject{
    
    // need to find a better way to point to the log status
   
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var firstName: String = ""
    @Published var carModel: String = ""

    
    @Published var showSignUp : Bool = false

    var userId:String = ""
    
    //MARK: SignUp
    
    func register(){
        Auth.auth().createUser(withEmail: self.email, password: self.password){ result, error in
            if error != nil{
                print(error!.localizedDescription)
            }
            
            self.userId = (Auth.auth().currentUser?.uid)!
            
            let db = Firestore.firestore()
            
            db.collection("Users").document(self.userId).setData(["firstName": self.firstName, "carModel": self.carModel]){ [self] (err) in
                
                if err != nil{
                    
                    print((err?.localizedDescription)!)
                    return
                }
                self.showSignUp.toggle()
            }
            
        }
    }
    

}

