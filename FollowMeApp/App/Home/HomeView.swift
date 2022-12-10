//
//  HomeView.swift
//  FollowMeApp
//
//  Created by Abdallah Abu Samaha on 11/26/22.
//

import SwiftUI
import MapKit
import CoreLocation
import Firebase

struct HomeView : View {
    @EnvironmentObject var locationSearchViewModel: LocationSearchViewModel
    @StateObject var viewModel:LoginViewModel
    @State var mapViewState:MapViewState = .isNotFollowing
    @State private var directions: [String] = []
    
    var body: some View{
        
        ZStack{
            VStack(spacing: 0){
                    
                    ZStack(){
                        
                        VStack() {
                            
                            Text("Follow App")
                                .font(.title)
                            
                        }.frame(maxWidth: .infinity, alignment: .center)
                        
                        if mapViewState == .isFollowing {
                            Button {
                                
                                mapViewState = .isNotFollowing
                            } label: {
                                
                                Image(systemName:  "arrow.left")
                                    .font(.title)
                                    .foregroundColor(.black)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        
                        
                        Button {
                            
                            locationSearchViewModel.showProfileView.toggle()
                        } label: {
                            Image(systemName: locationSearchViewModel.showProfileView ? "arrow.left" : "person.crop.circle")
                                .font(.title)
                                .foregroundColor(.black)
                        }
                        .frame(maxWidth: .infinity, alignment: locationSearchViewModel.showProfileView ? .leading: .trailing)

                    }
                    .padding()
                    .background(Color.white)
                    
                    if mapViewState == .isFollowing {
//                        List {
//                            ForEach(0..<directions.count, id: \.self){ direction in
//                                Text(directions[direction])
//                                    .padding()
//                            }
//                        }
                        
                        Text(directions.first ?? "Continue Striaght Ahead")
                    }
                    
                
                MapViewRepresentable(mapViewState: $mapViewState, directions: $directions)
                    
                    LogOutButton(viewModel: viewModel)
                        .padding()
                }
       
            if locationSearchViewModel.showProfileView {
                ProfileView(name: viewModel.name, carModel: viewModel.carModel, userId: viewModel.userId, mapViewState: $mapViewState)
                    .background(Color(.white))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
            }
           
        }
        
    }
}
            



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: LoginViewModel())
    }
}

        
