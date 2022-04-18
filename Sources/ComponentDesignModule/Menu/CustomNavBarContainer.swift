import SwiftUI

struct CustomNavBarContainer<Content: View>: View {
    @State private var showBackButton: Bool = true
    @State private var showSettingsButton: Bool = true
    @State private var title: String = ""
    @State private var subtitle: String? = "Subtitle"
    
    let colorBackground: Color
    let content: Content
    let fontText: Font
    let fontLogo: Font
    
    let firstText: String
    let secondText: String
    let icon: String
    
    init(
        @ViewBuilder content: () -> Content,
        colorBackground: Color,
        fontText: Font,
        fontLogo: Font,
        firstText: String,
        secondText: String,
        icon: String
    ) {
        self.content = content()
        self.colorBackground = colorBackground
        self.fontText = fontText
        self.fontLogo = fontLogo
        
        self.firstText = firstText
        self.secondText = secondText
        self.icon = icon
    }
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavBarView(
                showBackButton: showBackButton,
                showSettingsButton: showSettingsButton,
                title: title,
                subtitle: subtitle,
                colorBackground: colorBackground,
                fontText: fontText,
                fontLogo: fontLogo,
                firstText: firstText,
                secondText: secondText,
                icon: icon
            )
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onPreferenceChange(CustomNavBarTitlePreferenceKey.self, perform: { value in
            self.title = value
        })
        .onPreferenceChange(CustomNavBarSubtitlePreferenceKey.self, perform: { value in
            self.subtitle = value
        })
        .onPreferenceChange(CustomNavBarBackButtonHiddenPrefenceKey.self, perform: { value in
            self.showBackButton = !value
        })
        .onPreferenceChange(CustomNavBarSettingsButtonPreferenceKey.self, perform: { value in
            self.showSettingsButton = !value
        })
    }
}

struct CustomNavBarContainerPreviews: PreviewProvider {
    static var previews: some View {
        CustomNavBarContainer(
            content: {
                ZStack {
                    Color.gray.ignoresSafeArea()
                    
                    Text("Hola")
                        .customNavBarItems(
                            title: "Nuevo titulo",
                            subtitle: "subtitle",
                            backButtonHidden: false,
                            settingsButtonHidden: true
                        )
                }
            },
            colorBackground: Color.red,
            fontText: .system(size: 25),
            fontLogo: .system(size: 22),
            firstText: "measure",
            secondText: "trad",
            icon: "gear"
        )
    }
}
