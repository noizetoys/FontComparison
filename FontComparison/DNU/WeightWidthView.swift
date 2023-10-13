//
//  WeightWidthView.swift
//  FontComparison
//
//  Created by Apple User on 3/29/23.
//

import SwiftUI


struct WeightWidthView: View {
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                
                VStack {
                    TitleHeader(title: "Font Weight")
                    
                    FontWeightView()
                }
                .padding([.horizontal, .bottom])
                
                Spacer()
                
                VStack {
                    TitleHeader(title:"Font Width")
                    
                    FontWidthView()
                }
                .padding([.horizontal, .bottom])
                
            }
            .frame(width: .infinity, height: .infinity)
        }
    }
    
}


struct TitleHeader: View {
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title)
                .bold()
                .frame(width: .infinity)
        }
        .frame(height: 60)
        .frame(maxWidth: .infinity)
        .background(.gray.opacity(0.5))
        .cornerRadius(20)
    }
}


#Preview {
    WeightWidthView()
}
