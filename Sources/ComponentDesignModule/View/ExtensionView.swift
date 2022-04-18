import SwiftUI

public extension View {
    /*!
     Método para que el botón tenga una animación
     */
    func withPressableStyle(scaledAmount: CGFloat = 1.05) -> some View {
        buttonStyle(PressableButtonStyle(scaledAmount: scaledAmount))
    }
    
    func withDefaultButtonFormating(color: Color, font: Font, size: Int = 25) -> some View {
        modifier(CustomButtonViewModifier(color: color, size: size, font: font))
    }
}
