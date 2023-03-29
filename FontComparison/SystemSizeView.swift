//
//  SystemSizeView.swift
//  Property Viewer
//
//  Created by James Majors on 3/14/22.
//

import SwiftUI

struct SystemSizeView: View {
    
    var body: some View {
        VStack {
            Group {
                Text("largeTitle")
                    .font(.largeTitle)
                Text("title")
                    .font(.title)
                Text("title2")
                    .font(.title2)
                Text("title3")
                    .font(.title3)
                Text("headline")
                    .font(.headline)
                Text("subheadline")
                    .font(.subheadline)
            }
            
            Group {
                Text("body")
                    .font(.body)
                Text("callout")
                    .font(.callout)
                Text("caption")
                    .font(.caption)
                Text("caption2")
                    .font(.caption2)
                Text("footnote")
                    .font(.footnote)
            }
        }
    }
}

struct SystemSizeView_Previews: PreviewProvider {
    
    static var previews: some View {
        SystemSizeView()
    }
}
