//
//  FontWeightTextListView.swift
//  FontComparison
//
//  Created by Apple User on 9/4/23.
//

import SwiftUI


enum FontWeight: String, CaseIterable, Identifiable {
    case black
    case heavy
    case bold
    case semibold
    case medium
    case regular
    case light
    case thin
    case ultraLight
    
    var id: String { self.rawValue }

    var weight: Font.Weight {
        switch self {
            case .black: return .black
            case .bold: return .bold
            case .heavy: return .heavy
            case .light: return .light
            case .medium: return .medium
            case .regular: return .regular
            case .semibold: return .semibold
            case .thin: return .thin
            case .ultraLight: return .ultraLight
        }
    }
    
    var string: String {
        switch self {
            case .black: return "Black"
            case .bold: return "Bold"
            case .heavy: return "Heavy"
            case .light: return "Light"
            case .medium: return "Medium"
            case .regular: return "Regular"
            case .semibold: return "Semi-bold"
            case .thin: return "Thin"
            case .ultraLight: return "Ultra-light"
        }
    }
    
}



struct FontWeightTextListView: View {
    var text: String = ""
    var systemTextSize: CGFloat = 17
    
    
    var body: some View {
        VStack(spacing: 10.0) {
            ForEach(FontWeight.allCases) { weight in
                Text("\(displayText(for: weight)) (.\(weight.rawValue))")
                    .fontWeight(weight.weight)
            }
        }
        .font(.system(size: systemTextSize))
        .padding([.horizontal, .bottom])
    }
    
    
    private func displayText(for weight: FontWeight) -> String {
        text.isEmpty ? "\(text) \(weight.string) Text" : text
    }
    
}


#Preview {
    FontWeightTextListView(text: "Default", systemTextSize: 17)
}
