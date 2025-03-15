import Foundation
import SwiftUI

extension Color {
    // Primary
    static let primaryNormal: Color = .init(hex: "#006FCC")
    static let primaryAlternative: Color = .init(hex: "#58A0DD")
    static let primaryAssistive: Color = .init(hex: "#97C4E9")
    
    // Secondary
    static let secondaryNormal: Color = .init(hex: "#FFFFFF")
    static let secondaryAlternative: Color = .init(hex: "#FFFFFF")
    static let secondaryAssistive: Color = .init(hex: "#FFFFFF")
    
    // Label
    static let labelNormal: Color = .init(hex: "#0C0C0D")
    static let labelStrong: Color = .init(hex: "#000000")
    static let labelNeutral: Color = .init(hex: "#3B3B40")
    static let labelAlternative: Color = .init(hex: "#5E5E66")
    static let labelAssistive: Color = .init(hex: "#767680")
    static let labelDisable: Color = .init(hex: "#F6F6F7")
    
    // Line
    static let lineNormal: Color = .init(hex: "#E4E4E5")
    static let lineNeutral: Color = .init(hex: "#F2F2F3")
    static let lineAlternative: Color = .init(hex: "#F6F6F7")
    
    // Fill
    static let fillNormal: Color = .init(hex: "#F6F6F7")
    static let fillNeutral: Color = .init(hex: "#F2F2F3")
    static let fillAlternative: Color = .init(hex: "#E4E4E5")
    static let fillSupport: Color = .init(hex: "#FFFFFF")
    static let fillAssistive: Color = .init(hex: "#FFFFFF")
    
    // Background
    static let backgroundNormal: Color = .init(hex: "#FFFFFF")
    static let backgroundNeutral: Color = .init(hex: "#FCFCFD")
    static let backgroundAlternative: Color = .init(hex: "#FCFCFD")
    
    // Status
    static let statusError: Color = .init(hex: "#EE2B2B")
    static let statusWarning: Color = .init(hex: "#FFCC00")
    static let statusSuccess: Color = .init(hex: "#20DF33")
    static let statusInfo: Color = .init(hex: "#008BFF")
    
    // Static
    static let static99: Color = .init(hex: "#FFFFFF")
    static let static95: Color = .init(hex: "#000000")
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}
