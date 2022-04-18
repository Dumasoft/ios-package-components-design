import SwiftUI

public struct CircleLoading: View {
    @State var isLoading = false
    var color: Color
    
    public init(color: Color) {
        self.color = color
    }
    
    public var body: some View {
        ZStack {
            Circle()
                .stroke(Color(.systemGray5), lineWidth: 14)
                .frame(width: 100, height: 100)
            
            Circle()
                .trim(from: 0, to: 0.2)
                .stroke(color, lineWidth: 7)
                .frame(width: 100, height: 100)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .onAppear {
                    withAnimation(.linear(duration: 3).repeatForever(autoreverses: false)) {
                        self.isLoading = true
                    }
                }
        }
    }
}
