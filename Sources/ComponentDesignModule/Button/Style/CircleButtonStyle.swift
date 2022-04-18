import SwiftUI

public struct CircleButtonStyle: ButtonStyle {
    var colorText: Color
    var principalColor: Color
    var secondaryColor: Color
    
    public init(colorText: Color, principalColor: Color, secondaryColor: Color) {
        self.colorText = colorText
        self.principalColor = principalColor
        self.secondaryColor = secondaryColor
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 65, height: 65)
            .foregroundColor(self.colorText)
            .font(.system(size: 24))
            .background(configuration.isPressed ? self.secondaryColor : self.principalColor)
            .clipShape(Circle())
            .padding(6)
    }
}
