//
//  FontMenuView.swift
//  FontComparison
//
//  Created by Apple User on 3/29/23.
//

import SwiftUI


enum Destinations: String, View {
    case weight = "Font Weight"
    case width = "Font Width"
    case design = "Font Design"
    case styling = "Font Styling"
    case system = "System Font"
    case colors = "Colors"
    
    var body: some View {
        switch self {
            case .weight: FontWeightView()
            case .width: FontWidthView()
            case .design: FontDesignView()
            case .styling: FontStylingView()
            case .system: SystemFontDesignerView()
            case .colors: ColorsView()
        }
    }
}


struct FontMenuView: View {
    private let rainbowColors: [Color] = [
        .red, .orange, .yellow,
        .green,
        .blue, .indigo, .purple]
    
    @State private var destination: Destinations?
    
    var body: some View {
        NavigationStack {
            VStack {
                BasicButton(title: "System Font Designer", destination: .system)
                    .cornerRadius(10)
//                    .ignoresSafeArea(.keyboard, edges: .bottom)
                
                BasicButton(title: "Weight", destination: .weight)
                    .foregroundStyle(.black)
                    .fontWeight(.thin)
                
                BasicButton(title: "Width", destination: .width)
                    .fontWidth(.condensed)
                
                BasicButton(title: "Font Design", destination: .design)
                    .fontDesign(.serif)

                BasicButton(title: "Font Styling", destination: .styling)
                    .italic()
                    .underline()

//                BasicButton(title: "System Font Designer", destination: .system)
//                    .cornerRadius(10)
//                
                BasicButton(title: "Colors", destination: .colors)
                    .background(.linearGradient(colors: rainbowColors, startPoint: .top, endPoint: .bottom))
                    .foregroundStyle(.white)
                    .cornerRadius(10)
            }
            .navigationTitle("Select a View")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(item: $destination, destination: { destination in
                destination
                    .navigationTitle(destination.rawValue)
            })
            .padding()
        }
        
    }
    
    
    func BasicButton(title: String, destination: Destinations) -> some View {
        Button(role: .none) {
            self.destination = destination
        } label: {
            Text(title)
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .buttonStyle(.bordered)
    }
    
}


#Preview {
    FontMenuView()
}
