//
//  HomeViewActionButton.swift
//  FollowMeApp
//
//  Created by Abdallah Abu Samaha on 11/5/22.
//

import SwiftUI

struct HomeViewActionButton: View {
    @Binding var showUserSearchView: Bool
    
    var body: some View {
    
        Button {
            withAnimation(.spring()){
                showUserSearchView.toggle()
            }
            
        } label: {
            Image(systemName: showUserSearchView ? "arrow.left" : "ellipsis")
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .black, radius: 6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        

        
    }
}

struct HomeViewActionButton_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewActionButton(showUserSearchView: .constant(false))
    }
}
