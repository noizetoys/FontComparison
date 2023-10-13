//
//  SectionHeaderTitle.swift
//  FontComparison
//
//  Created by Apple User on 9/8/23.
//

import SwiftUI

struct SectionHeaderTitle: View {
    let title: String
    var backgroundColor: Color = .gray
    var radius: CGFloat = 10
    
    var fontWidth: Font.Width = .standard
    var fontDesign: Font.Design = .default
    
    var body: some View {
        Text(title)
            .bold()
            .font(.title2)
            .fontWidth(fontWidth)
            .fontDesign(fontDesign)
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
            .background {
                backgroundColor.opacity(0.5)
            }
            .clipShape(RoundedRectangle(cornerRadius: radius))
    }
}

#Preview {
    VStack {
        SectionHeaderTitle(title: "Section Title", fontWidth: .standard, fontDesign: .default)
        
        Spacer()
        
        SectionHeaderTitle(title: "Standard Width", fontWidth: .standard, fontDesign: .default)
        SectionHeaderTitle(title: "Compressed Width", fontWidth: .compressed, fontDesign: .default)
        SectionHeaderTitle(title: "Condensed Width", fontWidth: .condensed, fontDesign: .default)
        SectionHeaderTitle(title: "Expanded Width", fontWidth: .expanded, fontDesign: .default)
        
        Spacer()
        
        SectionHeaderTitle(title: "Default Design", fontWidth: .standard, fontDesign: .default)
        SectionHeaderTitle(title: "Monospaced Design", fontWidth: .standard, fontDesign: .monospaced)
        SectionHeaderTitle(title: "Rounded Design", fontWidth: .standard, fontDesign: .rounded)
        SectionHeaderTitle(title: "Serif Design", fontWidth: .standard, fontDesign: .serif)
    }
    .padding()
}
