//
//  File.swift
//  
//
//  Created by Maziar Saadatfar on 10/18/23.
//

import Foundation
import SwiftUI
import ControlKitBase

// Helper extension to convert UIColor to Color
extension Color {
    init(r: Int, g: Int, b: Int, a: Double = 1.0) {
        self.init(
            red: Double(r) / 255.0,
            green: Double(g) / 255.0,
            blue: Double(b) / 255.0,
            opacity: a
        )
    }
    
    init(uiColor: UIColor) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        self.init(red: Double(red), green: Double(green), blue: Double(blue), opacity: Double(alpha))
    }
}

public class LaunchAlertViewConfig {
    public init(lang: CKLanguage) {
        self.lang = lang
    }
    public let lang: CKLanguage
    public var style: LaunchAlertViewStyle = .fullscreen1
    
    public var contentViewBackColor: Color = Color(r: 0, g: 0, b: 0, a: 0.8)
    public var contentBackGroundImage: Image?
    public var popupViewBackColor: Color = .black
    public var popupViewCornerRadius: CGFloat = 15.0
    
    public var imageType: ImageType = .gear
    public var image: String?
    public var imageColor: Color?
    
    public var titleFont = Font.system(size: 18, weight: .heavy)
    public var title = "It's an alert"
    public var titleColor: Color = Color(r: 18, g: 18, b: 18)
    
    public var descriptionFont = Font.system(size: 16, weight: .medium)
    public var descriptionText = "It's an alert description."
    public var descriptionTextColor: Color = Color(r: 18, g: 18, b: 18)
    
    public var buttonFont = Font.system(size: 16, weight: .semibold)
    public var buttonNormalTitle: String = "Ok"
    public var buttonBackColor: Color = Color(r: 253, g: 105, b: 42)
    public var buttonTitleColor: Color = .white
    public var buttonCornerRadius: CGFloat = 20.0
    public var buttonBorderWidth: CGFloat = 0.0
    public var buttonBorderColor: Color = .clear
    
    public var closeButtonFont = Font.system(size: 16, weight: .semibold)
    public var closeButtonNormalTitle: String = "Close"
    public var closeButtonBackColor: Color = .clear
    public var closeButtonTitleColor: Color = .orange
    public var closeButtonCornerRadius: CGFloat = 20.0
    public var closeButtonBorderWidth: CGFloat = 0.0
    public var closeButtonBorderColor: Color = Color(r: 253, g: 105, b: 42)
    public var closeButtonImage: Image?
    public var closeButtonImageColor: Color = Color(r: 253, g: 105, b: 42)
    public var contentViewAlpha: Double = 1.0
}

public enum ImageType: String {
    case alertIcon1 = "alert1"
    case alertIcon2 = "alert2"
    case alertIcon3 = "alert3"
    case alertIcon4 = "alert4"
    case alertIcon5 = "alert5"
    case gear = "gear"
}
