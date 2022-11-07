//
//  UserSearchView.swift
//  FollowMeApp
//
//  Created by Abdallah Abu Samaha on 11/5/22.
//

import SwiftUI

struct UserSearchView: View {
    
    @State private var startLocationText = ""
    @State private var userToFollow = ""
    
    var body: some View {
        
        VStack {
        // header view
     
            TextField(" SelectUser", text: $userToFollow)
                    .frame(height: 50)
                    .background(Color(.systemGray4))
                    .padding(.horizontal)
                    .padding(.top, 64)
            
            Divider()
                .padding(.vertical)
            
        // list view
            ScrollView{
                VStack(alignment: .leading){
                    ForEach(0..<3, id: \.self){ _ in
                        UserProfilesView()
                    }
                }
            }
        }
        .background(.white)
    }
}

    
    
    

struct UserSearchView_Previews: PreviewProvider {
    static var previews: some View {
        UserSearchView()
    }
}
