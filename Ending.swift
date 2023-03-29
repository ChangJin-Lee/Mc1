import SwiftUI
import Foundation

struct AnimatableSystemFontModifier: ViewModifier, Animatable {
    var size: Double
    var weight: Font.Weight
    var design: Font.Design

    var animatableData: Double {
        get { size }
        set { size = newValue }
    }

    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: weight, design: design))
    }
}

struct EndingScreenView: View {
    
    @State private var fontSize = 32.0
    
    var body: some View{
        
        if #available(iOS 16.0, *) {
            NavigationStack {
                Text("Hello, World!")
                    .animatableSystemFont(size: fontSize)
                    .onTapGesture {
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 1).repeatForever()) {
                            fontSize = 72
                        }
                    }
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: EndingScreenView()){
                        Text("넘어가기 버튼")
                            .foregroundColor(Color.black)
                            .frame(width: 100, height: 60, alignment: .center)
                            .background(RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray))
                    }
                }
            }
        } else {
            // Fallback on earlier versions
        }
        
    }
}

extension View {
    func animatableSystemFont(size: Double, weight: Font.Weight = .regular, design: Font.Design = .default) -> some View {
        self.modifier(AnimatableSystemFontModifier(size: size, weight: weight, design: design))
    }
}

