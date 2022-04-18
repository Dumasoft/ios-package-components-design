import SwiftUI


/// Representa una esquina redondeada
public struct CustomCorner: Shape {
    ///Esquina
    var corners: UIRectCorner
    
    /// Angulo
    var size: CGFloat
    
    /// Description
    /// - Parameter rect: Angulo de la esquina
    /// - Returns: Devuelve la figuara
    public func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: size, height: size)
        )
        
        return Path(path.cgPath)
    }
}

extension View {
    public func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(CustomCorner(corners: corners, size: radius))
    }
}
