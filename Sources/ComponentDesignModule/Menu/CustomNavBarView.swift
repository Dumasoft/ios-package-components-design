import SwiftUI


struct CustomNavBarView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let showBackButton: Bool
    let showSettingsButton: Bool
    let title: String
    let subtitle: String?
    let colorBackground: Color
    let fontText: Font
    let fontLogo: Font
    
    let firstText: String
    let secondText: String
    let icon: String
    
    var body: some View {
        HStack {
            if showBackButton {
                backButton
            }
            
            Spacer()
            
            if title == "" {
                LogoMenuView(
                    font: fontLogo,
                    firstText: firstText,
                    secondText: secondText,
                    icon: icon
                )
            } else {
                titleSubtitle
            }
            
            
            Spacer()
            
            if showSettingsButton {
                // TODO: MOSTRAR EL MENÚ CUANDO TENGA UNA FUNCIONALIDAD CLARA
                // settingsButton
            }
        }
        .padding()
        .accentColor(.white)
        .foregroundColor(.white)
        .font(.headline)
        .background(
            colorBackground
                .ignoresSafeArea(edges: .top)
        )
    }
}

extension CustomNavBarView {
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
        }
        .font(.title)
    }
    
    private var titleSubtitle: some View {
        VStack(spacing: 4) {
            Text(title.lowercased())
                .font(fontText)
                .fontWeight(.semibold)
            if let subtitle = subtitle {
                Text(subtitle)
            }
        }
    }
    
    private var settingsButton: some View {
        CustomNavLink(
            destination: Text("hola"),
            label: {
                Image(systemName: "gear")
                    .font(.title)
            },
            colorBackground: colorBackground,
            fontText: fontText,
            fontLogo: fontLogo,
            firstText: firstText,
            secondText: secondText,
            icon: icon
        )
    }
}


struct CustomNavBarViewPreview: PreviewProvider {
    static var previews: some View {
        VStack {
            CustomNavBarView(
                showBackButton: true,
                showSettingsButton: true,
                title: "Prueba",
                subtitle: "Subprueba",
                colorBackground: Color.red,
                fontText: .system(size: 25),
                fontLogo: .system(size: 22),
                firstText: "measure",
                secondText: "trad",
                icon: "gear"
            )
            Spacer()
        }
       
    }
}

