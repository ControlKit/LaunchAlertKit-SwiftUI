//
//  LaunchAlertViewProtocol.swift
//
//
//  Created by Maziar Saadatfar on 10/16/23.
//

import Foundation
import SwiftUI
import ControlKitBase

public protocol LaunchAlertViewProtocol: View {
    var viewModel: LaunchAlertViewModel { get }
    var config: LaunchAlertViewConfig { get }
    var onAccept: () -> Void { get }
    var onCancel: () -> Void { get }
}

public extension LaunchAlertViewProtocol {
    @ViewBuilder
    func iconView(color: Color?, image: String?, imageType: ImageType) -> some View {
        Group {
            if let color = color, let image = image {
                if image.contains("http"), let url = URL(string: image) {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .success(let img):
                            img
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(color)
                        case .failure(_), .empty:
                            if let defaultImage = ImageHelper.swiftUIImage(imageType.rawValue) {
                                defaultImage
                                    .renderingMode(.template)
                                    .foregroundColor(color)
                            }
                        @unknown default:
                            EmptyView()
                        }
                    }
                } else if let img = ImageHelper.swiftUIImage(image) {
                    img
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(color)
                } else if let img = ImageHelper.swiftUIImage(imageType.rawValue) {
                    img
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(color)
                }
            } else {
                if let img = image {
                    if img.contains("http"), let url = URL(string: img) {
                        AsyncImage(url: url) { phase in
                            switch phase {
                            case .success(let image):
                                image
                                    .resizable()
                            case .failure(_), .empty:
                                if let defaultImage = ImageHelper.swiftUIImage(imageType.rawValue) {
                                    defaultImage
                                        .resizable()
                                }
                            @unknown default:
                                EmptyView()
                            }
                        }
                    } else if let localImage = ImageHelper.swiftUIImage(img) {
                        localImage
                            .resizable()
                    }
                } else if let defaultImage = ImageHelper.swiftUIImage(imageType.rawValue) {
                    defaultImage
                        .resizable()
                }
            }
        }
    }
    
    @ViewBuilder
    func closeButtonIcon(color: Color?, image: Image?) -> some View {
        if let image = image {
            image
                .renderingMode(color != nil ? .template : .original)
        } else {
            (ImageHelper.swiftUIImage("close") ?? Image(systemName: "xmark"))
                .renderingMode(color != nil ? .template : .original)
        }
    }
}
