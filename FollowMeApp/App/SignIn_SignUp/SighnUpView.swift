//
//  SighnUpView.swift
//  FollowMeApp
//
//  Created by Abdallah Abu Samaha on 11/7/22.
//

import SwiftUI

struct SighnUpView: View {
    
    @StateObject var viewModel:SignUPViewModel = SignUPViewModel()
    @Binding var showSignUp: Bool
    var body: some View {
        
        VStack() {
            
            HStack {
                Button {
                    showSignUp.toggle()
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.title)
                        .foregroundColor(.black)
                        .padding()
                        .background(.white)
                        .padding(.leading)
            }.frame( alignment: .topLeading)
            
                
                Spacer()
            }
            
            Text("Sign Up")
                .font(.title)
            .fontWeight(.bold)
            
            
            VStack() {
                
                TextFieldView(fieldText: "Name", inputText: $viewModel.firstName)

                
                TextFieldView(fieldText: "Email", inputText: $viewModel.email)
                PassWordView(fieldText: "Password", inputText: $viewModel.password)
                

                TextFieldView(fieldText: "Car Model", inputText: $viewModel.carModel)
       
                SignUpButton(viewModel: viewModel, showSignUp: $showSignUp)
            }
            
            Spacer()
        }
        .background(.white)
    }
}

struct SignUpButton: View{
    
    @StateObject var viewModel: SignUPViewModel
    @Binding var showSignUp: Bool
    
    private func SignUpCondition(viewModel:SignUPViewModel) -> Bool {
        viewModel.firstName == "" ||
        viewModel.email == "" ||
        viewModel.password == "" ||
        viewModel.carModel == ""
    }
    
    var body: some View{
        
        Button {
            viewModel.register()
            showSignUp.toggle()

        }
        label: {
            Text("Sighn Up")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.black))
        }
        .padding(.horizontal)
        .disabled(SignUpCondition(viewModel: viewModel))
        .opacity(SignUpCondition(viewModel: viewModel) ? 0.5 : 1)
    }
}


struct SighnUpView_Previews: PreviewProvider {
    static var previews: some View {
        SighnUpView(showSignUp: .constant(false))
    }
}
