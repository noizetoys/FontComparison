//
//  ColorsView.swift
//  FontComparison
//
//  Created by Apple User on 3/29/23.
//

import SwiftUI

struct ColorsView: View {
    let colors: [(Color, Color)] = [
        (.black, .white),
        (.blue, .white),
        (.brown, .black),
        (.clear, .black),
        (.cyan, .black),
        (.gray, .white),
        (.green, .black),
        (.indigo, .white),
        (.mint, .black),
        (.orange, .black),
        (.pink, .white),
        (.purple, .white),
        (.red, .black),
        (.teal, .black),
        (.white, .black),
        (.yellow, .black),
        (.accentColor, .white),
        (.primary, .black),
        (.secondary, .white),
    ]
    
    var body: some View {
        Form {
                
            ForEach(colors, id: \.0) { aColor in
                colorCell(aColor)
            }
            
        }
        .background(.gray)
    }
    
    
    private func colorCell(_ colors: (Color, Color)) -> some View {
        HStack {
            Text(colors.0.description.capitalized)
                .foregroundColor(colors.1)
                .bold()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 40)
        .background(colors.0)
        .cornerRadius(8)
        .padding(.horizontal, -10)
        .padding(.top, -5)
    }
}

struct ColorsView_Previews: PreviewProvider {
    static var previews: some View {
        ColorsView()
    }
}
