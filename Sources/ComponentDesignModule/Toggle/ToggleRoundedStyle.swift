import SwiftUI


public struct ToggleRoundedStyle: ToggleStyle {
    let selectColor: Color
    let unselectColor: Color
    
    public init(selectColor: Color, unselectColor: Color) {
        self.selectColor = selectColor
        self.unselectColor = unselectColor
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        GroupBox {
            HStack {
                configuration.label
                Button {
                    configuration.isOn.toggle()
                } label: {
                    ToggleRoundedItem(
                        isOn: configuration.isOn,
                        selectColor: selectColor,
                        unselectColor: unselectColor
                    )
                }
            }
        }
    }
    
    struct ToggleRoundedItem: View {
        var isOn: Bool
        var selectColor: Color
        var unselectColor: Color
        
        var body: some View {
            RoundedRectangle(cornerRadius: 5)
                .stroke(isOn ? selectColor : unselectColor)
                .frame(width: 60, height: 20)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(isOn ? selectColor : unselectColor)
                        .frame(width: 30, height: 20),
                    alignment: isOn ? .trailing : .leading
                )
                .animation(.linear(duration: 0.2))
        }
    }
}
