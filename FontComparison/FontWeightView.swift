//
//  FontWeightView.swift
//  LaborUI
//
//  Created by James Majors on 3/14/22.
//

import SwiftUI


struct FontWeightView: View {
    @State private var fontSize: CGFloat = 17
    @State private var customText: String = ""
    
    
    private var displayText: String {
        customText.isEmpty ? "\(fontSize.precisionString()) Points" : customText
    }
    
    
    var body: some View {
        VStack {
            SectionHeaderTitle(title: "\(fontSize.precisionString()) Point System Font", fontWidth: .standard, fontDesign: .default)
            
            ScrollView {
                FontWeightTextListView(text: displayText, systemTextSize: fontSize)
                    .padding(.top)
            }
            
            FontSizeSection(customText: $customText, fontSize: $fontSize)
            
            VStack {
                SectionHeaderTitle(title: "Sample Text")
                ClearableTextField(customText: $customText)
            }
            .padding(.bottom)
        }
        .padding()
        
    }
    
}


#Preview {
    NavigationStack {
        FontWeightView()
            .navigationTitle("Font Weight")
            .navigationBarTitleDisplayMode(.inline)
    }
}

