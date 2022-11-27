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
    @StateObject var viewModel:LoginViewModel
    
    @State var map = MKMapView()
    @State var manager = CLLocationManager()
    @State var alert = false
    @State var source : CLLocationCoordinate2D!
    @State var destination : CLLocationCoordinate2D!
    @State var name = ""
    @State var distance = ""
    @State var time = ""
    @State var show = false
    @State var loading = false
    @State var book = false
    @State var doc = ""
    @State var data : Data = .init(count: 0)
    @State var search = false
    
    @State var showProfileView:Bool = false
    
    var body: some View{
        
        ZStack{
            VStack(spacing: 0){
                    
                    ZStack(){
                        
                        VStack() {
                            
                            Text(self.destination != nil ? "Following \(viewModel.name)" : "Follow Me")
                                .font(.title)
                            
                            if self.destination != nil{
                                
                                Text(self.name)
                                    .fontWeight(.bold)
                            }
                        }.frame(maxWidth: .infinity, alignment: .center)
                        
                        Button {
                            showProfileView.toggle()
                        } label: {
                            Image(systemName: showProfileView ? "arrow.left" : "person.crop.circle")
                                .font(.title)
                                .foregroundColor(.black)
                        }
                        .frame(maxWidth: .infinity, alignment: showProfileView ? .leading: .trailing)

                    }
                    .padding()
                    .background(Color.white)
                    
                    MapView(map: self.$map, manager: self.$manager, alert: self.$alert, source: self.$source, destination: self.$destination, name: self.$name,distance: self.$distance,time: self.$time, show: self.$show)
                    .onAppear {
                    
                        self.manager.requestAlwaysAuthorization()
                    }
                    
                    LogOutButton(viewModel: viewModel)
                        .padding()
                }
       
            if showProfileView {
                ProfileView(name: viewModel.name, carModel: viewModel.carModel, userId: viewModel.userId)
                    .background(Color(.white))
                    
            }
           
        }
        
    }
}
            



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: LoginViewModel())
    }
}

        
