//
//  UserSearchView.swift
//  FollowMeApp
//
//  Created by Abdallah Abu Samaha on 11/5/22.
//

import SwiftUI

struct UserSearchBarView: View {
    var body: some View {
        HStack {
            Circle() // will be replaced with user profile
                .fill(.black)
                .frame(width: 8 , height: 8)
                .padding(.horizontal)
            
            Text("Select user")
                .foregroundColor(.gray)
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width - 64, height: 50)
        .background(
            Rectangle()
                .fill(.white)
                .shadow(color: .black, radius: 6)
        )
    }
}

struct UserSearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        UserSearchBarView()
    }
}
