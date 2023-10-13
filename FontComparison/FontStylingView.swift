//
//  FontStylingView.swift
//  FontComparison
//
//  Created by Apple User on 9/5/23.
//

import SwiftUI


enum FontStyling: String, CaseIterable, Identifiable, Hashable {
    var id: String { self.rawValue }
    
    case bold = "Bold"
    case italic = "Italic"
    case underline = "Underline"
    case strikethrough = "Strikethrough"
    case textCase = "Text Case"
    case monospaced = "Mono-spaced"
    case monospacedDigit = "Mono-spaced Digit"
    
//    var style: Font.TextStyle {
//        switch self {
//            case .bold: return Font.TextStyle.
//            case .italic:
//            case .underline:
//            case .strikethrough:
//            case .textCase:
//            case .monospaced:
//            case .monospacedDigit:
//        }
//    }
}


enum LinestylePattern: String, CaseIterable, Identifiable {
    case solid = "Solid"
    case dot = "Dot"
    case dash = "Dash"
    case dashDot = "Dash-Dot"
    case dashDotDot = "Dash-Dot-Dot"
    
    var id: String { self.rawValue }
    
    var pattern: Text.LineStyle.Pattern {
        switch self {
            case .solid: return .solid
            case .dot: return .dot
            case .dash: return .dash
            case .dashDot: return .dashDot
            case .dashDotDot: return .dashDotDot
        }
    }
    
}


enum TextCase: String, CaseIterable, Identifiable {
    case lowerCase = "lowercase"
    case upperCase = "UPPERCASE"
    
    var id: String { self.rawValue }
    
    var textCase: Text.Case {
        switch self {
            case .upperCase: return .uppercase
            case .lowerCase: return .lowercase
        }
    }
}



struct FontStylingView: View {
    @State private var style: FontStyling = .bold
    @State private var lineStylePattern: LinestylePattern = .solid
    
    @State private var boldActive = false
    @State private var italicActive = false
    @State private var underlineActive = false
    @State private var strikeThroughActive = false
    @State private var textCaseActive = false
    @State private var textCase: TextCase = .upperCase
    @State private var monospacedActive = false
    @State private var monospacedDigitActive = false
    
    @State private var fontSize: CGFloat = 17
    @State private var customText: String = ""

    private var displayText: String {
        customText.isEmpty ? styleString : customText
    }

    
    var body: some View {
        VStack {
            SectionHeaderTitle(title: styleString)
            
            ScrollView {
                FontStyleTextListView(text: displayText)
                
                Text("1, 10, 100, 1000, 1000")
                    .strikethrough(strikeThroughActive, pattern: .dashDotDot, color: .red)
                    .font(.title)
            }
            .bold(boldActive)
            .italic(italicActive)
            .underline(underlineActive, pattern: lineStylePattern.pattern)
            .strikethrough(strikeThroughActive, pattern: lineStylePattern.pattern)
            .if(textCaseActive) { view in
                view.textCase(textCase.textCase)
            }
            .monospaced(monospacedActive)
            .if(monospacedDigitActive) { view in
                view.monospacedDigit()
            }
            
            
            Spacer()
//            FontSizeSection(customText: $customText, fontSize: $fontSize)
            
            SectionHeaderTitle(title: "Select Font Style")
//                .font(.smallCaps(.title)())
//                .font(.lowercaseSmallCaps(.title)())
//                .font(.uppercaseSmallCaps(.title)())

            FontStylingGrid(style: $style,
                            lineStylePattern: $lineStylePattern,
                            boldActive: $boldActive, italicActive: $italicActive, 
                            underlineActive: $underlineActive,
                            strikeThroughActive: $strikeThroughActive,
                            textCaseActive: $textCaseActive,
                            textCase: $textCase,
                            monospacedActive: $monospacedActive,
                            monospacedDigitActive: $monospacedDigitActive)
        }
        .padding()
    }
    
    
    private var styleString: String {
        var styleStrings = [String]()
        
        if boldActive { styleStrings.append(FontStyling.bold.rawValue) }
        if italicActive { styleStrings.append(FontStyling.italic.rawValue) }
        if underlineActive { styleStrings.append(FontStyling.underline.rawValue) }
        if strikeThroughActive { styleStrings.append(FontStyling.strikethrough.rawValue) }
        if textCaseActive {
            let caseText = FontStyling.textCase.rawValue
            let caseType = textCase.rawValue
            styleStrings.append("\(caseText) (\(caseType))")
        }
        if monospacedActive { styleStrings.append(FontStyling.monospaced.rawValue) }
        if monospacedDigitActive { styleStrings.append(FontStyling.monospacedDigit.rawValue) }
        
        
        let count = styleStrings.count
        
        if count > 1 {
            return "\(count) Selected"
        }
        else if count == 1 {
            return styleStrings.first!
        }
        else {
            return "Font Style"
        }
        
    }
    
}


struct FontStylingGrid: View {
    @Binding var style: FontStyling
    @Binding var lineStylePattern: LinestylePattern
    
    @Binding var boldActive: Bool
    @Binding var italicActive: Bool
    @Binding var underlineActive: Bool
    @Binding var strikeThroughActive: Bool
    @Binding var textCaseActive: Bool
    @Binding var textCase: TextCase
    @Binding var monospacedActive: Bool
    @Binding var monospacedDigitActive: Bool
    
    
    var body: some View {
        VStack {
            HStack {
                gridButton(.bold, conditional: $boldActive)
                gridButton(.italic, conditional: $italicActive)
            }
            
            HStack {
                gridButton(.monospaced, conditional: $monospacedActive)
                gridButton(.underline, conditional: $underlineActive)
            }
            
            HStack {
                gridButton(.monospacedDigit, conditional: $monospacedDigitActive)
            }
            
            HStack {
                gridButton(.textCase, conditional: $textCaseActive)
                
                if textCaseActive {
                    Picker("Text Case Picker", selection: $textCase) {
                        ForEach(TextCase.allCases) { aCase in
                            Text(aCase.rawValue).tag(aCase)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            
            HStack {
                gridButton(.strikethrough, conditional: $strikeThroughActive)
                
                if strikeThroughActive {
                    Picker("Strikethrough Line Pattern Picker", selection: $lineStylePattern) {
                        ForEach(LinestylePattern.allCases) { pattern in
                            Text(pattern.rawValue).tag(pattern)
                        }
                    }
                }
                
            }
        }
        .animation(.easeIn, value: textCaseActive)
        .animation(.easeIn, value: strikeThroughActive)
        
    }
    
    func gridButton(_ style: FontStyling, conditional: Binding<Bool>) -> some View {
        Button(role: .none) {
            conditional.wrappedValue.toggle()
        } label: {
            HStack {
                Text(style.rawValue)
                    .bold(style == .bold)
                    .italic(style == .italic)
                    .underline(style == .underline, pattern: lineStylePattern.pattern)
                    .strikethrough(style == .strikethrough, pattern: lineStylePattern.pattern)
                    .textCase(style == .textCase ? .uppercase : .none)
                    .monospaced(style == .monospaced)
                    .if(style == .monospacedDigit) { view in
                        view.monospacedDigit()
                    }
                
                if conditional.wrappedValue == true {
                    Image(systemName: "checkmark")
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: 30)
        }
        .buttonStyle(.bordered)
        
    }

}

struct StylingPicker: View {
    @Binding var selectedStyling: FontStyling
    
    var body: some View {
        Picker("Choose Styling", selection: $selectedStyling) {
            ForEach(FontStyling.allCases) { style in
                Text(style.rawValue).tag(style)
            }
            
        }
        .pickerStyle(.segmented)
    }
}


struct LinePatternPicker: View {
    @State var selectedLinePattern: LinestylePattern = .solid
    @State var patternRequired: Bool = false
    
    
    var body: some View {
        if patternRequired {
            Picker("Choose Line Pattern", selection: $selectedLinePattern) {
                ForEach(LinestylePattern.allCases) { pattern in
                    Text(pattern.rawValue).tag(pattern)
                }
                
            }
            .pickerStyle(.segmented)
        }
    }
}


#Preview {
    NavigationStack {
        FontStylingView()
            .navigationTitle("Font Style")
            .navigationBarTitleDisplayMode(.inline)
//            .font(.smallCaps(.title)())
    }
}
