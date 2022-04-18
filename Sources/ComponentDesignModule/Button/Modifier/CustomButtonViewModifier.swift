import SwiftUI

struct CustomButtonViewModifier: ViewModifier {
    var color: Color
    var size: Int = 25
    var font: Font
    
    public init(color: Color, size: Int, font: Font) {
        self.color = color
        self.size = size
        self.font = font
    }
    
    public func body(content: Content) -> some View {
        content
            .font(font)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(color)
            .cornerRadius(10)
            .shadow(color: color.opacity(0.3), radius: 10, x: 0.0, y: 10)
    }
}
