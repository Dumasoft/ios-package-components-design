import SwiftUI

public struct GenericButton: View {
    let color: Color
    let text: String
    let action: () -> Void
    var size: Int = 25
    
    public init (color: Color, text: String, size: Int, action: @escaping () -> Void) {
        self.color = color
        self.text = text
        self.size = size
        self.action = action
    }
    
    public var body: some View {
        Button(action: action, label: {
            Text(text.lowercased())
                .withDefaultButtonFormating(
                    color: color,
                    font: .system(size: self.size),
                    size: self.size
                )
        })
        .withPressableStyle()
        .padding()
    }
}
