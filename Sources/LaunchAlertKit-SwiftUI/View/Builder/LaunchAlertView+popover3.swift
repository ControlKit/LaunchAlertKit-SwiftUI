//
//  File.swift
//
//
//  Created by Maziar Saadatfar on 10/16/23.
//

import Foundation
import SwiftUI
import ControlKitBase

public struct LaunchAlertView_Popover3: LaunchAlertViewProtocol {
    public var viewModel: LaunchAlertViewModel
    public var config: LaunchAlertViewConfig
    public var onAccept: () -> Void
    public var onCancel: () -> Void
    
    public var body: some View {
        ZStack {
            // Content View Background
            config.contentViewBackColor
                .opacity(0.8)
                .ignoresSafeArea()
            
            // Background Image
            if let backgroundImage = config.contentBackGroundImage {
                backgroundImage
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }
            
            // Icon (outside popup)
            iconView(
                color: config.imageColor,
                image: config.image,
                imageType: config.imageType
            )
            .frame(width: 175, height: 150)
            .offset(y: -40)
            
            // Popup View
            VStack(spacing: 0) {
                // Popup Content
                VStack(spacing: 0) {
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
                        .padding(.top, 24)
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
                            .frame(width: 250, height: 44)
                            .background(config.buttonBackColor)
                            .cornerRadius(config.buttonCornerRadius)
                            .overlay(
                                RoundedRectangle(cornerRadius: config.buttonCornerRadius)
                                    .stroke(config.buttonBorderColor, lineWidth: config.buttonBorderWidth)
                            )
                    }
                    .padding(.top, 30)
                    
                    // Close Button
                    Button(action: {
                        viewModel.setAction(.canceled)
                        onCancel()
                    }) {
                        Text(config.closeButtonNormalTitle)
                            .font(config.closeButtonFont)
                            .foregroundColor(config.closeButtonTitleColor)
                            .frame(width: 250, height: 44)
                            .background(config.closeButtonBackColor)
                            .cornerRadius(config.closeButtonCornerRadius)
                            .overlay(
                                RoundedRectangle(cornerRadius: config.closeButtonCornerRadius)
                                    .stroke(config.closeButtonBorderColor, lineWidth: config.closeButtonBorderWidth)
                            )
                    }
                    .padding(.top, 8)
                    .padding(.bottom, 50)
                }
                .frame(maxWidth: .infinity)
                .background(config.popupViewBackColor)
                .cornerRadius(config.popupViewCornerRadius)
                .padding(.horizontal, 60)
            }
        }
    }
}

public class Popover3LaunchAlertViewConfig: LaunchAlertViewConfig {
    public override init(lang: CKLanguage) {
        super.init(lang: lang)
        style = .popover3
        popupViewBackColor = .white
        titleFont = Font.system(size: 20, weight: .heavy)
        descriptionFont = Font.system(size: 16, weight: .medium)
        titleColor = Color(r: 24, g: 32, b: 53)
        descriptionTextColor = Color(r: 96, g: 98, b: 104)
        imageType = .alertIcon1
        buttonTitleColor = .white
        closeButtonBorderColor = Color(r: 253, g: 105, b: 42)
        closeButtonTitleColor = Color(r: 253, g: 105, b: 42)
        closeButtonBorderWidth = 1
    }
}
