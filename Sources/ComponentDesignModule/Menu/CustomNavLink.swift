import SwiftUI

public struct CustomNavLink<Label: View, Destination: View>: View {
    let destination: Destination
    let label: Label
    let colorBackground: Color
    let fontText: Font
    let fontLogo: Font
    
    let firstText: String
    let secondText: String
    let icon: String
    
    public init (
        destination: Destination,
        @ViewBuilder label: () -> Label,
        colorBackground: Color,
        fontText: Font,
        fontLogo: Font,
        firstText: String,
        secondText: String,
        icon: String
    ) {
        self.destination = destination
        self.label = label()
        self.colorBackground = colorBackground
        self.fontText = fontText
        self.fontLogo = fontLogo
        
        self.firstText = firstText
        self.secondText = secondText
        self.icon = icon
    }
    
    public var body: some View {
        NavigationLink(
            destination:
                CustomNavBarContainer(
                    content: { destination },
                    colorBackground: colorBackground,
                    fontText: fontText,
                    fontLogo: fontLogo,
                    firstText: firstText,
                    secondText: secondText,
                    icon: icon
                )
                .navigationBarHidden(true)
            ,
            label: { label }
        )
    }
}


struct CustomNavLink_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavView(
            content: {
                CustomNavLink(
                    destination: Text("Hola"),
                    label: { Text("Ir") },
                    colorBackground: Color.blue,
                    fontText: .system(size: 25),
                    fontLogo: .system(size: 22),
                    firstText: "measure",
                    secondText: "trad",
                    icon: "gear"
                )
            },
            color: Color.blue,
            fontText: .system(size: 25),
            fontLogo: .system(size: 22),
            firstText: "measure",
            secondText: "trad",
            icon: "gear"
        )
    }
}
