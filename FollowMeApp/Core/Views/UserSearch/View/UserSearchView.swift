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
            HStack{
                
                VStack{
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 6, height: 6)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1 , height: 24)
                    
                    Rectangle()
                        .fill(Color(.black))
                        .frame(width: 6, height: 6)
            }
                
                VStack{
                    TextField("Current Location", text: $startLocationText)
                        .frame(height: 32)
                        .background(Color(.systemGroupedBackground))
                        .padding(.trailing)
            
                    TextField("SelectUser", text: $userToFollow)
                        .frame(height: 32)
                        .background(Color(.systemGray4))
                    .padding(.trailing)
                    
                }
        }
            .padding(.horizontal)
            .padding(.top, 64)
            
            Divider()
                .padding(.vertical)
            
        // list view
            ScrollView{
                VStack(alignment: .leading){
                    ForEach(0..<20, id: \.self){ _ in
                        UserSearchResults()
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
