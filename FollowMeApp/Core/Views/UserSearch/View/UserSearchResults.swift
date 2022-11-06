//
//  UserSearchResults.swift
//  FollowMeApp
//
//  Created by Abdallah Abu Samaha on 11/5/22.
//

import SwiftUI

struct UserSearchResults: View {
    var body: some View {
        HStack{
            Image(systemName: "person.circle.fill")
                .resizable()
                .foregroundColor(.black)
                .accentColor(.white)
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading, spacing: 4){
                Text("Abdallah")
                    .font(.body)
                Text("HondaAccord, 6FZX977")
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                Divider()

            }
        }
        .padding(.leading, 8)
        .padding(.vertical, 8)
    }
}

struct UserSearchResults_Previews: PreviewProvider {
    static var previews: some View {
        UserSearchResults()
    }
}
