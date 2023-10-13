//
//  ClearableTextField.swift
//  FontComparison
//
//  Created by Apple User on 9/4/23.
//

import SwiftUI


struct ClearableTextField: View {
    @Binding var customText: String
    
    var body: some View {
        HStack {
//            Image(systemName: "pencil")
            
            TextField("Enter Sample Text", text: $customText)
                .textFieldStyle(.roundedBorder)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(style: StrokeStyle())
                }
            
            if !customText.isEmpty {
                Button {
                    customText = ""
                } label: {
                    Image(systemName: "multiply.circle.fill")
                }
                .padding(.trailing, 10)
            }
        }
    }
    
}


struct ClearableTextFieldWithTitle: View {
    @Binding var customText: String

    var body: some View {
        VStack {
            Text("Custom Sample Text")
                .font(.title)
                .bold()
                .padding(.vertical)
            
            ClearableTextField(customText: $customText)
        }
    }
    
}


#Preview {
    ClearableTextField(customText: .constant("Sample Text"))
}
