//
//  TextFieldView.swift
//  FollowMeApp
//
//  Created by Abdallah Abu Samaha on 11/6/22.
//

import SwiftUI

struct TextFieldView: View {
    
    let fieldText:String
    @Binding var inputText:String

    var body: some View {
        TextField(fieldText, text: $inputText)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10)
                .stroke())
            .padding(.horizontal)
            .textInputAutocapitalization(.never)
    }
}

struct TextFieldView_Previews: PreviewProvider {
    
    static var previews: some View {
        TextFieldView(fieldText: "Input",inputText: .constant(""))
    }
}
