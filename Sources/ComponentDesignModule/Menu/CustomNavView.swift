import SwiftUI


public struct CustomNavView<Content: View>: View {
    let content: Content
    let color: Color
    let fontText: Font
    let fontLogo: Font
    
    let firstText: String
    let secondText: String
    let icon: String
    
    public init(
        @ViewBuilder content: () -> Content,
        color: Color,
        fontText: Font,
        fontLogo: Font,
        firstText: String,
        secondText: String,
        icon: String
    ) {
        self.content = content()
        self.color = color
        self.fontText = fontText
        self.fontLogo = fontLogo
        
        self.firstText = firstText
        self.secondText = secondText
        self.icon = icon
    }
    
    public var body: some View {
        NavigationView {
            CustomNavBarContainer(
                content: { content },
                colorBackground: color,
                fontText: fontText,
                fontLogo: fontLogo,
                firstText: firstText,
                secondText: secondText,
                icon: icon
            )
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct CustomNavViewPreviews: PreviewProvider {
    static var previews: some View {
        CustomNavView(
            content: {
                Color.orange
                    .ignoresSafeArea()
            },
            color: Color.red,
            fontText: .system(size: 25),
            fontLogo: .system(size: 22),
            firstText: "measure",
            secondText: "trad",
            icon: "gear"
        )
    }
}
