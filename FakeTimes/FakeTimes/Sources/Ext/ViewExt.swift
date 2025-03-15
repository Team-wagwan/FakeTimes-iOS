import Foundation
import SwiftUI


extension View {
    func font(_ font: UIFont) -> some View {
        let fontSpacing = font.pointSize / 4
        return self
            .font(Font(font))
            .background(.red)
            .padding(.vertical, fontSpacing)
            .background(.blue)
            .lineSpacing(fontSpacing * 2)
    }
}

