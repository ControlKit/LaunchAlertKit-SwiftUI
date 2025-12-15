//
//  ImageHelper.swift
//  ControlKitBase
//
//  Created by Maziar Saadatfar on 9/1/25.
//
import Foundation
import SwiftUI

public class ImageHelper {
    public static var resolvedBundle: Bundle {
#if SWIFT_PACKAGE
        return Bundle.module
#else
        return Bundle(for: self)
#endif
    }
    
    public static func image(_ name: String) -> UIImage? {
        return UIImage(named: name,
                       in: resolvedBundle,
                       compatibleWith: nil)
    }
    
    public static func swiftUIImage(_ name: String) -> Image? {
        if let uiImage = image(name) {
            return Image(uiImage: uiImage)
        }
        return nil
    }
}

