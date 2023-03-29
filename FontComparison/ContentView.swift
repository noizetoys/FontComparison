//
//  ContentView.swift
//  FontComparison
//
//  Created by Apple User on 3/29/23.
//

import SwiftUI

struct ContentView: View {
    private let rainbowColors: [Color] = [
        .red,
        .orange,
        .yellow,
        .green,
        .blue,
        .indigo,
        .purple]
    
    var body: some View {
        NavigationStack {
            
            NavigationLink {
                SizeWeightView()
                    .navigationTitle("Size & Weight")
            } label: {
                HStack(alignment: .bottom) {
                    Text("Size")
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .padding(.bottom, -2)
                    
                    Text("&")
                        .foregroundColor(.black)
                        .font(.title3)
                        .bold()
                    
                    Text("Weight")
                        .foregroundColor(.black)
                        .font(.title)
                        .bold()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.gray.opacity(0.5))
            .cornerRadius(20)
            .padding()
            
            Spacer()
            
            NavigationLink {
                ColorsView()
                    .navigationTitle("Colors")
            } label: {
                Text("Colors")
                    .foregroundColor(.black)
                    .font(.title)
                    .bold()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.linearGradient(colors: [.red, .orange, .yellow, .green, .blue, .indigo, .purple], startPoint: .top, endPoint: .bottom))
            .cornerRadius(20)
            .padding()
        }
        
    }
    
    
    var weight: some View {
        NavigationLink {
            FontWeightView()
                .navigationTitle("Weight")
        } label: {
            Text("Weight")
                .foregroundColor(.black)
                .font(.title)
                .bold()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray.opacity(0.5))
        .cornerRadius(20)
        .padding()
    }
    
    var size: some View {
            NavigationLink {
                SystemSizeView()
                    .navigationTitle("Size")
            } label: {
                Text("Size")
                    .foregroundColor(.black)
                    .font(.title)
                    .bold()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.gray.opacity(0.5))
            .cornerRadius(20)
            .padding()
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
