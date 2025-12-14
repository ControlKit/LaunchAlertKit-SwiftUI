//
//  File.swift
//
//
//  Created by Maziar Saadatfar on 10/16/23.
//

import Foundation
import SwiftUI
import ControlKitBase

public struct LaunchAlertView_FullScreen1: LaunchAlertViewProtocol {
    public var viewModel: LaunchAlertViewModel
    public var config: LaunchAlertViewConfig
    public var onAccept: () -> Void
    public var onCancel: () -> Void
    
    public var body: some View {
        ZStack {
            // Content View Background
            config.contentViewBackColor
                .ignoresSafeArea()
            
            // Background Image
            if let backgroundImage = config.contentBackGroundImage {
                backgroundImage
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }
            
            // Main Content
            VStack(spacing: 0) {
                // Close Button
                HStack {
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
                    .padding(.leading, 16)
                    .padding(.top, 48)
                    
                    Spacer()
                }
                
                Spacer()
                
                // Icon
                iconView(
                    color: config.imageColor,
                    image: config.image,
                    imageType: config.imageType
                )
                .aspectRatio(contentMode: .fill)
                .frame(width: 191, height: 139)
                .padding(.bottom, 70)
                
                // Title
                Text(config.title)
                    .font(config.titleFont)
                    .foregroundColor(config.titleColor)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                    .padding(.bottom, 16)
                
                // Description
                Text(config.descriptionText)
                    .font(config.descriptionFont)
                    .foregroundColor(config.descriptionTextColor)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                    .frame(minHeight: 50)
                
                Spacer()
                
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
                .padding(.bottom, 60)
            }
            .ignoresSafeArea()
            
        }
        .cornerRadius(20)
        .ignoresSafeArea()
    }
}

public class FullScreen1LaunchAlertViewConfig: LaunchAlertViewConfig {
    public override init(lang: CKLanguage) {
        super.init(lang: lang)
        style = .fullscreen1
        titleColor = .white
        descriptionTextColor = Color(r: 235, g: 235, b: 235)
    }
}
