//
//  File.swift
//
//
//  Created by Maziar Saadatfar on 10/16/23.
//

import Foundation
import SwiftUI
import ControlKitBase

public struct LaunchAlertView_Popover1: LaunchAlertViewProtocol {
    public var viewModel: LaunchAlertViewModel
    public var config: LaunchAlertViewConfig
    public var onAccept: () -> Void
    public var onCancel: () -> Void
    
    public var body: some View {
        ZStack {
            // Content View Background
            config.contentViewBackColor
                .opacity(config.contentViewAlpha)
                .ignoresSafeArea()
            
            // Background Image
            if let backgroundImage = config.contentBackGroundImage {
                backgroundImage
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }
            
            // Popup View
            VStack(spacing: 0) {
                // Popup Content
                VStack(spacing: 0) {
                    // Close Button
                    HStack {
                        Spacer()
                        Button(action: {
                            viewModel.setAction(.canceled)
                            onCancel()
                        }) {
                            closeButtonIcon(
                                color: config.closeButtonImageColor,
                                image: config.closeButtonImage
                            )
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(config.closeButtonImageColor)
                            .padding(8)
                        }
                        .frame(width: 40, height: 40)
                        .padding(.trailing, 8)
                        .padding(.top, 8)
                    }
                    
                    // Icon
                    iconView(
                        color: config.imageColor,
                        image: config.image,
                        imageType: config.imageType
                    )
                    .frame(width: 64, height: 63)
                    .padding(.top, 66)
                    
                    // Title
                    Text(config.title)
                        .font(config.titleFont)
                        .foregroundColor(config.titleColor)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 21)
                        .padding(.top, 41)
                        .frame(minHeight: 30)
                    
                    // Description
                    Text(config.descriptionText)
                        .font(config.descriptionFont)
                        .foregroundColor(config.descriptionTextColor)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 21)
                        .padding(.top, 10)
                        .frame(minHeight: 50)
                    
                    // Button
                    Button(action: {
                        viewModel.openLink()
                        viewModel.setAction(.accepted)
                        onAccept()
                    }) {
                        Text(config.buttonNormalTitle)
                            .font(config.buttonFont)
                            .foregroundColor(config.buttonTitleColor)
                            .frame(width: 222, height: 56)
                            .background(config.buttonBackColor)
                            .cornerRadius(config.buttonCornerRadius)
                            .overlay(
                                RoundedRectangle(cornerRadius: config.buttonCornerRadius)
                                    .stroke(config.buttonBorderColor, lineWidth: config.buttonBorderWidth)
                            )
                    }
                    .padding(.top, 30)
                    .padding(.bottom, 28)
                }
                .frame(maxWidth: .infinity)
                .background(config.popupViewBackColor)
                .cornerRadius(config.popupViewCornerRadius)
                .padding(.horizontal, 24)
            }
        }
    }
}

public class Popover1LaunchAlertViewConfig: LaunchAlertViewConfig {
    public override init(lang: CKLanguage) {
        super.init(lang: lang)
        style = .popover1
        image = "gear"
        imageColor = Color(r: 18, g: 18, b: 18)
        contentViewBackColor = .white
        popupViewBackColor = Color(r: 216, g: 235, b: 227)
    }
}
