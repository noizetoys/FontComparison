//
//  FontWeightView.swift
//  LaborUI
//
//  Created by James Majors on 3/14/22.
//

import SwiftUI


struct FontWeightView: View {
    
    var body: some View {
        
        VStack {
            Text("Black Text")
                .fontWeight(.black)
            Text("Bold Text")
                .fontWeight(.bold)
            Text("Heavy Text")
                .fontWeight(.heavy)
            Text("Light Text")
                .fontWeight(.light)
            Text("Medium Text")
                .fontWeight(.medium)
            Text("Regular Text")
                .fontWeight(.regular)
            Text("Semi-bold Text")
                .fontWeight(.semibold)
            Text("Thin Text")
                .fontWeight(.thin)
            Text("Ultra-light Text")
                .fontWeight(.ultraLight)
        }
        
    }
}

struct FontWeightView_Previews: PreviewProvider {
    static var previews: some View {
        FontWeightView()
    }
}
