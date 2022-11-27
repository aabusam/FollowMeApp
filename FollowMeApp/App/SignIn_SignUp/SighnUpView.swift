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
        
        VStack {
            
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

            
            Text("Sign Up")
                .font(.title)
            .fontWeight(.bold)
            
            HStack{
                TextFieldView(fieldText: "First Name", inputText: $viewModel.firstName)
                TextFieldView(fieldText: "Last Email", inputText: $viewModel.lastName)
            }
            
            TextFieldView(fieldText: "Email", inputText: $viewModel.email)
            PassWordView(fieldText: "Password", inputText: $viewModel.password)
            
            HStack{
                TextFieldView(fieldText: "Car Model", inputText: $viewModel.carModel)
                TextFieldView(fieldText: "Licsence Plate", inputText: $viewModel.licsencePlate)
            }
            SignUpButton(viewModel: viewModel, showSignUp: $showSignUp)
        }
        .background(.white)
    }
}

struct SignUpButton: View{
    
    @StateObject var viewModel: SignUPViewModel
    @Binding var showSignUp: Bool
    
    private func SignUpCondition(viewModel:SignUPViewModel) -> Bool {
        viewModel.lastName == "" ||
        viewModel.firstName == "" ||
        viewModel.email == "" ||
        viewModel.password == "" ||
        viewModel.carModel == "" ||
        viewModel.licsencePlate == ""}
    
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
