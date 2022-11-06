//
//  HomeView.swift
//  FollowMeApp
//
//  Created by Abdallah Abu Samaha on 11/5/22.
//

import SwiftUI

struct HomeView: View {
    @State private var showUserSearchView = false
    
    var body: some View {
        ZStack(alignment: .top) {
            
            FollowMeMapViewRepresentable()
                .ignoresSafeArea()
            
            if showUserSearchView{
                UserSearchView()

            }else{
                UserSearchBarView()
                .padding(.top, 72) // must create a function that calculates the correct padding
                .onTapGesture{
                    withAnimation(.spring()) {
                        showUserSearchView.toggle()
                    }
                }
            }
            
            HomeViewActionButton(showUserSearchView: $showUserSearchView)
                .padding(.leading)
                .padding(.top, 4 )
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
