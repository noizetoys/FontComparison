//
//  FontDesign.swift
//  FontComparison
//
//  Created by Apple User on 9/4/23.
//

import SwiftUI


enum FontDesign: String, CaseIterable, Identifiable {
    case defaultDesign = "Default"
    case monospaced = "Monospaced"
    case rounded = "Rounded"
    case serif = "Serif"
    
    var id: String {
        self.rawValue
    }
    
    var design: Font.Design {
        switch self {
            case .defaultDesign: Font.Design.default
            case .monospaced: Font.Design.monospaced
            case .rounded: Font.Design.rounded
            case .serif: Font.Design.serif
        }
    }
    
}



struct FontDesignView: View {
    @State private var fontDesign: FontDesign = .defaultDesign
    @State private var customText: String = ""
    
    private var displayText: String {
        customText.isEmpty ? "\(fontDesign.rawValue)" : customText
    }

    
    var body: some View {
        VStack {
            SectionHeaderTitle(title: fontDesign.rawValue, fontDesign: fontDesign.design)
            
            ScrollView {
                FontWeightTextListView(text: fontDesign.rawValue)
                    .fontDesign(fontDesign.design)
                    .frame(maxWidth: .infinity)
            }
            
            Spacer()
            
            SectionHeaderTitle(title: "Select Font Design")

            Picker("Choose Font Design", selection: $fontDesign) {
                ForEach(FontDesign.allCases, id: \.rawValue) { design in
                    Text(design.rawValue).tag(design)
                }
                
            }
            .pickerStyle(.segmented)
            
            VStack {
                SectionHeaderTitle(title: "Sample Text")
                ClearableTextField(customText: $customText)
            }
            .padding(.bottom)

//            Spacer()
        }
        .padding()
    }
    
}


#Preview {
    NavigationStack {
        FontDesignView()
            .navigationTitle("Font Design")
            .navigationBarTitleDisplayMode(.inline)
    }
}
