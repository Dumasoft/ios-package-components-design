import SwiftUI


public struct ImageWithText: View {
    let text: String
    let nameImage: String
    let font: Font
    
    public init(text: String, nameImage: String, font: Font) {
        self.text = text
        self.nameImage = nameImage
        self.font = font
    }
    
    public var body: some View {
        ZStack {
            Image(nameImage)
                .resizable()
                .scaledToFit()
                .cornerRadius(15, corners: [.topLeft, .topRight])
                .overlay(
                    VStack{
                        Spacer()
                        ZStack(alignment: .leading) {
                            BlurViewRepresentable(effect: .dark)
                                .frame(height: 40)
                            Text(text)
                                .padding(.horizontal)
                                .font(font)
                                .foregroundColor(.white)
                        }
                        
                    }
                    
                )
           
        }
    }
}

struct ImageWithTextPreviews: PreviewProvider {
    static var previews: some View {
        ImageWithText(text: "El ferrado", nameImage: "scene_silvan", font: .system(size: 12))
            .previewLayout(.sizeThatFits)
    }
}
