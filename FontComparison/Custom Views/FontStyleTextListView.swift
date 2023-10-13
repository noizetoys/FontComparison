//
//  FontStyleTextListView.swift
//  FontComparison
//
//  Created by Apple User on 9/4/23.
//

import SwiftUI


enum TextStyle: String, CaseIterable, Identifiable {
    case largeTitle
    case title
    case title2
    case title3
    case headline
    case body
    case callout
    case subheadline
    case footnote
    case caption
    case caption2
    
    var id: String { self.rawValue }
    
//    var font: Font? {
//        switch self {
//            case .largeTitle: return Font.largeTitle
//            case .title: return Font.title
//            case .title2: return Font.title2
//            case .title3: return Font.title3
//            case .headline: return Font.headline
//            case .body: return Font.body
//            case .callout: return Font.callout
//            case .subheadline: return Font.subheadline
//            case .footnote: return Font.footnote
//            case .caption: return Font.caption
//            case .caption2: return Font.caption2
//        }
//    }
    
    var style: Font.TextStyle {
        switch self {
            case .largeTitle: return .largeTitle
            case .title: return .title
            case .title2: return .title2
            case .title3: return .title3
            case .headline: return .headline
            case .body: return .body
            case .callout: return .callout
            case .subheadline: return .subheadline
            case .footnote: return .footnote
            case .caption: return .caption
            case .caption2: return .caption2
                
        }
    }
    
    var string: String {
        switch self {
            case .largeTitle: return "Large Title"
            case .title: return "Title"
            case .title2: return "Title 2"
            case .title3: return "Title 3"
            case .headline: return "Headline"
            case .body: return "Body"
            case .callout: return "Callout"
            case .subheadline: return "Sub-headline"
            case .footnote: return "Footnote"
            case .caption: return "Caption"
            case .caption2: return "Caption 2"
        }
    }
}


struct FontStyleTextListView: View {
    var text: String?

    var body: some View {
        VStack(spacing: 10.0) {
            
            ForEach(TextStyle.allCases) { style in
                Text("\(text ?? style.string) (.\(style.rawValue))")
                    .font(.system(style.style))
            }
        }
        .padding()
    }
    
}


#Preview {
    NavigationStack {
        FontStyleTextListView()
            .navigationTitle("Font Style")
    }
}
