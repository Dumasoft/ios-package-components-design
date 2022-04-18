import SwiftUI

public struct PressableButtonStyle: ButtonStyle {
    var scaledAmount: CGFloat
    let unit = 1.0
    
    public init(scaledAmount: CGFloat = 0.2) {
        self.scaledAmount = scaledAmount
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaledAmount : unit)
            .opacity(configuration.isPressed ? 0.8 : unit)
    }
}
