//
//  SystemFontDesignerView.swift
//  FontComparison
//
//  Created by Apple User on 9/4/23.
//

import SwiftUI

struct SystemFontDesignerView: View {
    @State private var customText: String = ""
    @State private var fontSize: CGFloat = 17
    
    @State private var fontWeight: FontWeight = .regular
    
    @State private var fontWidth: FontWidth = .standard
    
    @State private var fontStyle: FontStyling = .bold
    @State private var lineStylePattern: LinestylePattern = .solid

    @State private var fontDesign: FontDesign = .defaultDesign
    
    @State private var textStyle:  TextStyle = .body
    
    @State private var boldActive = false
    @State private var italicActive = false
    @State private var underlineActive = false
    @State private var strikeThroughActive = false
    @State private var textCaseActive = false
    @State private var textCase: TextCase = .upperCase
    @State private var monospacedActive = false
    @State private var monospacedDigitActive = false

    private var displayText: String {
        customText.isEmpty ? "Example Text" : customText
    }

//    private var designBorderColor: Color = .black
    private var designBorderColor: Color = .clear
    
    var body: some View {
        ScrollView {
            Section {
                exampleText
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .overlay(content: {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1)
                    })
                
                Spacer()
                
                ClearableTextField(customText: $customText)
                    .padding(.bottom, 10)
            } header: {
                SectionHeaderTitle(title: "Sample Text")
//                    .font(.headline)
//                    .bold()
//                    .padding(.vertical, 10)
//                    .frame(maxWidth: .infinity)
//                    .background {
//                        Color.gray.opacity(0.5)
//                    }
//                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .border(designBorderColor)
            
            
//            Section {
            SectionHeaderTitle(title: "System Font Options")
//                Text("System Font Options")
//                    .font(.headline)
//                    .bold()
//                    .padding(.vertical, 10)
//                    .frame(maxWidth: .infinity)
//                    .background {
//                        Color.gray.opacity(0.5)
//                    }
//                    .clipShape(RoundedRectangle(cornerRadius: 10))

                SizeSlider(chosenSize: $fontSize, customText: $customText, text: "Select Size", isDisabled: textStyle != .body)
                    .padding(.top)
                
                Divider()
                
                VStack(spacing: 5) {
                    fontWeightView
                        .border(designBorderColor)
                    
                    fontWidthView
                        .border(designBorderColor)

                    fontDesignView
                        .border(designBorderColor)

                    textStyleView
                }
                .border(designBorderColor)

                Divider()
                
                fontStylingView
                    .padding(.bottom)
                    .border(designBorderColor)
//            } header: {
//                Text("System Font Options")
//                    .font(.title)
//                    .bold()
//                    .padding(.vertical, 10)
//                    .frame(maxWidth: .infinity)
//                    .background {
//                        Color.gray.opacity(0.5)
//                    }
//                    .clipShape(RoundedRectangle(cornerRadius: 10))
//            }
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                resetButton {
                    resetValues()
                }
                .font(.title2)
            }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .border(designBorderColor)
    }
    
    
    private func resetValues() {
        customText = ""
        fontSize = 17
        
        fontWeight = .regular
        
        fontWidth = .standard
        
        fontStyle = .bold
        lineStylePattern = .solid
        
        fontDesign = .defaultDesign
        
        textStyle = .body
        
        resetFontSytle()
    }
        
    
    private func resetFontSytle() {
        boldActive = false
        italicActive = false
        underlineActive = false
        strikeThroughActive = false
        textCaseActive = false
        textCase = .upperCase
        monospacedActive = false
        monospacedDigitActive = false

    }
    
    
    private var fontWeightView: some View {
        HStack(alignment: .firstTextBaseline) {
            resetButton {
                fontWeight = .regular
            }

            headerTitle("Font Weight")
            
            Spacer()
            
            Picker("Font Weight", selection: $fontWeight) {
                ForEach(FontWeight.allCases) { weight in
                    Text(weight.rawValue.capitalized)
                        .tag(weight)
                }
            }
        }
        
    }
    
    
    private var fontWidthView: some View {
        HStack(alignment: .firstTextBaseline) {
            resetButton {
                fontWidth = .standard
            }

            headerTitle("Font Width")
            
            Spacer()
            
            Picker("Choose Font Design", selection: $fontWidth) {
                ForEach(FontWidth.allCases) { width in
                    Text(width.rawValue).tag(width)
                }
            }
            .disabled(fontDesign != .defaultDesign )
        }

    }

    
    private var fontDesignView: some View {
        HStack(alignment: .firstTextBaseline) {
            resetButton {
                fontDesign = .defaultDesign
            }

            headerTitle("Font Design")
            
            Spacer()
            
            Picker("Choose Font Design", selection: $fontDesign) {
                ForEach(FontDesign.allCases, id: \.rawValue) { design in
                    Text(design.rawValue).tag(design)
                }
            }
            .disabled(fontWidth != .standard)
        }
    }

    
    private var textStyleView: some View {
        HStack(alignment: .firstTextBaseline) {
            resetButton {
                textStyle = .body
            }

            headerTitle("Text Style")
            
            Spacer()
            
            Picker("Choose Text Style", selection: $textStyle) {
                ForEach(TextStyle.allCases) { style in
                    Text(style.string).tag(style)
                }
            }
        }
    }

    
    private var fontStylingView: some View {
        VStack(spacing: 5) {
            HStack {
                resetButton {
                    resetFontSytle()
                }

                headerTitle("Select Font Style")
                
                Spacer()
            }
            
            FontStylingGrid(style: $fontStyle,
                            lineStylePattern: $lineStylePattern,
                            boldActive: $boldActive, italicActive: $italicActive,
                            underlineActive: $underlineActive,
                            strikeThroughActive: $strikeThroughActive,
                            textCaseActive: $textCaseActive,
                            textCase: $textCase,
                            monospacedActive: $monospacedActive,
                            monospacedDigitActive: $monospacedDigitActive)
        }
    }
    
    
    private func resetButton(for reset: @escaping () -> Void) -> some View {
        Button(action: {
            withAnimation {
                reset()
            }
        }, label: {
            Image(systemName: "slider.horizontal.2.gobackward")
//            Image(systemName: "arrow.circlepath")
                .foregroundStyle(Color.blue)
                .padding(.trailing)
        })

    }
    
    
    private func headerTitle(_ text: String) -> some View {
        Text(text)
            //                .font(.smallCaps(.title)())
            //                .font(.lowercaseSmallCaps(.title)())
            //                .font(.uppercaseSmallCaps(.title)())
            .bold()
    }
    
    
    var exampleText: some View {
        Text(displayText)
            .multilineTextAlignment(.leading)
            .lineLimit(3)
            .if(textStyle == .body) { textView in
                textView.font(.system(size: fontSize, weight: fontWeight.weight, design: fontDesign.design))
            }
            .if(textStyle != .body) { textView in
                textView.font(.system(textStyle.style, design: fontDesign.design, weight: fontWeight.weight))
            }
            .fontWidth(fontWidth.width)
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
            .padding(10)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        
            .frame(height: 80)
    }
    
}


#Preview {
    NavigationStack {
        SystemFontDesignerView()
            .navigationTitle("System Font Designer")
            .navigationBarTitleDisplayMode(.inline)
    }
}
