//
//  SizeWeightView.swift
//  FontComparison
//
//  Created by Apple User on 3/29/23.
//

import SwiftUI

struct SizeWeightView: View {
    
    var body: some View {
        VStack {
            Spacer()
            
            Section {
                
                VStack {
                    HStack {
                        Text("Weight")
                            .font(.title)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .padding(.horizontal)
                    .background(.gray.opacity(0.5))
                    .cornerRadius(20)

                    FontWeightView()
                }
                .padding(.horizontal)
            }
            
            Spacer()
            
            Section {
                
                VStack {
                    HStack {
                        Text("System Size")
                            .font(.title)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .padding(.horizontal)
                    .background(.gray.opacity(0.5))
                    .cornerRadius(20)
                    
                    SystemSizeView()
                }
                .padding(.horizontal)
            }
            
            Spacer()
        }
    }
    
}


struct SizeWeightView_Previews: PreviewProvider {
    static var previews: some View {
        SizeWeightView()
    }
}
