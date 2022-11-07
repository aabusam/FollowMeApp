//
//  PassWordView.swift
//  FollowMeApp
//
//  Created by Abdallah Abu Samaha on 11/6/22.
//

import SwiftUI

struct PassWordView: View {
    
    let fieldText:String
    @Binding var inputText:String
    @State var showPassword:Bool = false

    var body: some View {
        
        HStack {
     
            if showPassword {
                TextField(fieldText, text: $inputText)
            }else{
                SecureField(fieldText, text: $inputText)
            }

            
            Button {
                showPassword.toggle()
            } label: {
                Image(systemName: showPassword ? "eye.slash" : "eye")
                    .foregroundColor(.black)
            }

        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10)
            .stroke())
        .padding(.horizontal)
        .textInputAutocapitalization(.never)
    }
}

struct PassWordView_Previews: PreviewProvider {
    static var previews: some View {
        PassWordView(fieldText: "Password", inputText: .constant(""))
    }
}
