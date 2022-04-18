import SwiftUI


public struct BlurViewRepresentable: UIViewRepresentable {
    var effect: UIBlurEffect.Style
    
    public func makeUIView(context: UIViewRepresentableContext<BlurViewRepresentable>) -> some UIView {
        let blurEffect = UIBlurEffect(style: effect)
        let blurView = UIVisualEffectView(effect: blurEffect)
        return blurView
    }
    
    public func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
