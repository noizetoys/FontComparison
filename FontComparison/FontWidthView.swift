//
//  FontWidthView.swift
//  Property Viewer
//
//  Created by James Majors on 3/14/22.
//

import SwiftUI


enum FontWidth: String, CaseIterable, Identifiable {
    case standard = "Standard"
    case compressed = "Compressed"
    case condensed = "Condensed"
    case expanded = "Expanded"
    
    var id: String {
        self.rawValue
    }
    
    var width: Font.Width {
        switch self {
            case .standard: Font.Width.standard
            case .compressed: Font.Width.compressed
            case .condensed: Font.Width.condensed
            case .expanded: Font.Width.expanded
        }
    }
    
}


struct FontWidthView: View {
    @State private var fontWidth: FontWidth = .standard
    @State private var customText: String = ""

    private var displayText: String {
        customText.isEmpty ? "\(fontWidth.rawValue)" : customText
    }

    
    var body: some View {
        VStack {
            SectionHeaderTitle(title: fontWidth.rawValue, fontWidth: fontWidth.width)
                
            ScrollView {
                FontStyleTextListView(text: displayText)
                    .fontWidth(fontWidth.width)
            }

            VStack {
                SectionHeaderTitle(title: "Select Width")
                
                Picker("Choose Font Design", selection: $fontWidth) {
                    ForEach(FontWidth.allCases) { width in
                        Text(width.rawValue).tag(width)
                    }
                    
                }
                .pickerStyle(.segmented)
            }
            
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
        FontWidthView()
            .navigationTitle("Font Width")
            .navigationBarTitleDisplayMode(.inline)
    }
}
