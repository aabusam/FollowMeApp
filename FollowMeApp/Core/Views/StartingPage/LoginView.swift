//
//  LoginView.swift
//  FollowMeApp
//
//  Created by Abdallah Abu Samaha on 11/6/22.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel: LoginViewModel = LoginViewModel()
    @State var useFaceID:Bool = false
    
    var body: some View {
        VStack {
            Text("Login")
                .font(.title)
            .foregroundColor(.black)
        
            //MARK: Text Fields
            
            TextFieldView(fieldText: "Email", inputText: $viewModel.email)
            PassWordView(fieldText: "Password", inputText: $viewModel.password)
            
            //MARK: user prompt to ask to store FaceID on next time
            
            FaceIdButton(viewModel: viewModel, useFaceID: $useFaceID)
            
            loginButton(viewModel: viewModel, useFaceID: $useFaceID)
                .alert(viewModel.errorMsg, isPresented: $viewModel.showError) {}
        }
        
    }
}


struct loginButton: View{
    
    @StateObject var viewModel: LoginViewModel
    @Binding var useFaceID:Bool
    
    var body: some View{
        
        Button {
            Task{
                do{
                    try await viewModel.loginUser(useFaceID: useFaceID)
                }
                catch{
                    viewModel.errorMsg = error.localizedDescription
                    viewModel.showError.toggle()
                }
            }
        }
        label: {
            Text("Login")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.black))
        }
        .padding(.horizontal)
        .disabled(viewModel.email == "" || viewModel.password == "")
        .opacity(viewModel.email == "" || viewModel.password == "" ? 0.5 : 1)
        
        
    }
    
}

struct FaceIdButton: View{
    @StateObject var viewModel: LoginViewModel
    @Binding var useFaceID:Bool
    
    var body: some View{
        if viewModel.getBioMetricStatus(){
            Group{
                        if viewModel.useFaceID{
                            
                            Button {
                                //Mark DO FaceID Action
                                Task{
                                    do {
                                        try await viewModel.authenticationUser()
                                    }
                                    catch {
                                        viewModel.errorMsg = error.localizedDescription
                                        viewModel.showError.toggle()
                                    }
                                }
                            } label: {
                                VStack(alignment: .leading, spacing: 10){
                                    Label{
                                        Text("Use FaceID to login into previous account")
                                    } icon: {
                                        Image(systemName: "faceid")
                                    }
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                }
                                .padding(.vertical)
                                
                            }

                        }else{
                            Toggle(isOn: $useFaceID){
                                Text("Use FaceID to login")
                                    .foregroundColor(.gray)
                            }
                        }
                    }.padding(.horizontal)
        }
        
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

