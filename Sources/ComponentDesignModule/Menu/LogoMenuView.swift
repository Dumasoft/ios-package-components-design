import SwiftUI

public struct LogoMenuView: View {
    var font: Font
    var firstText: String
    var secondText: String
    var icon: String
    
    public init(font: Font, firstText: String, secondText: String, icon: String) {
        self.font = font
        self.firstText = firstText
        self.secondText = secondText
        self.icon = icon
    }
    
    public var body: some View {
        HStack(spacing: 4) {
            Text(firstText)
                .font(font)
                .fontWeight(.thin)
                .foregroundColor(.white)
            
            Image(systemName: icon)
                .font(.caption2)
                .foregroundColor(.white)
            
            Text(secondText)
                .font(font)
                .foregroundColor(.white)
        }
    }
}

struct LogoMenuView_Previews: PreviewProvider {
    static var previews: some View {
        LogoMenuView(
            font: .system(size: 22),
            firstText: "measure",
            secondText: "trad",
            icon: "pawprint.fill"
        )
        .previewLayout(.sizeThatFits)
    }
}
