import SwiftUI

public struct CircleButton<Label: View>: View {
    let label: Label
    var colorText: Color
    var principalColor: Color
    var secondaryColor: Color
    var action: () -> () = {}
    
    public init(
        colorText: Color,
        principalColor: Color,
        secondaryColor: Color,
        action: @escaping () -> Void,
        @ViewBuilder label: () -> Label
    ) {
        self.colorText = colorText
        self.principalColor = principalColor
        self.secondaryColor = secondaryColor
        self.action = action
        self.label = label()
    }
    
    public var body: some View {
        Button(action: action, label: { label })
        .buttonStyle(
            CircleButtonStyle(
                colorText: colorText,
                principalColor: principalColor,
                secondaryColor: secondaryColor
            )
        )
    }
}
