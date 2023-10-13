//
//  SizeSlider.swift
//  FontComparison
//
//  Created by Apple User on 9/7/23.
//

import SwiftUI


struct SizeSlider: View {
    @Binding var chosenSize: CGFloat
    @Binding var customText: String
    let text: String
    let isDisabled: Bool
    
    private let fontSizeRange: ClosedRange<CGFloat> = 6...34
    
    
    var body: some View {
        VStack {
            HStack {
                Text(fontSizeRange.lowerBound.precisionString())
                Spacer()
                
                Text("\(chosenSize.precisionString() ) Points")
                    .bold()
                
                Spacer()
                Text(fontSizeRange.upperBound.precisionString())
            }
            .if(isDisabled) { view in
                view.foregroundStyle(Color.gray.opacity(0.5))
            }
            
            Slider(value: $chosenSize, in: fontSizeRange, step: 1.0)
                .disabled(isDisabled)
        }
    }
    
}


struct SizeSliderWithText: View {
    @Binding var chosenSize: CGFloat
    @Binding var customText: String
    let text: String
    let isDisabled: Bool
    
    var body: some View {
        HStack {
            VStack {
                Text(text)
                    .if(isDisabled) { view in
                        view.foregroundStyle(Color.gray)
                    }
                    .font(.title)
                    .bold()
                    .padding(.bottom)
                
                SizeSlider(chosenSize: $chosenSize, customText: $customText, text: text, isDisabled: isDisabled)
            }
            .padding([.horizontal, .top])
        }
    }
}


//#Preview {
//    SizeSlider()
//}
