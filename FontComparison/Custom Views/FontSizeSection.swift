//
//  FontSizeSection.swift
//  FontComparison
//
//  Created by Apple User on 9/8/23.
//

import SwiftUI

struct FontSizeSection: View {
    @Binding var customText: String
    @Binding var fontSize: CGFloat
    
    
    var body: some View {
        VStack {
            SectionHeaderTitle(title: "Select Size")
            
            SizeSlider(chosenSize: $fontSize, customText: $customText, text: "Select Size", isDisabled: false)
        }
    }
    
}

#Preview {
    FontSizeSection(customText: .constant("Custom Text"), fontSize: .constant(17))
}
