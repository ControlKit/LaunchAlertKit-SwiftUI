//
//  LaunchAlertViewStyle.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
import SwiftUI
import ControlKitBase

public enum LaunchAlertViewStyle {
    case fullscreen1
    case popover5
    case popover1
    case popover2
    case popover3
    case popover4
    
    @ViewBuilder
    public static func make(
        viewModel: LaunchAlertViewModel,
        config: LaunchAlertViewConfig,
        onAccept: @escaping () -> Void,
        onCancel: @escaping () -> Void
    ) -> some View {
        switch config.style {
        case .fullscreen1:
            LaunchAlertView_FullScreen1(
                viewModel: viewModel,
                config: config,
                onAccept: onAccept,
                onCancel: onCancel
            )
        case .popover1:
            LaunchAlertView_Popover1(
                viewModel: viewModel,
                config: config,
                onAccept: onAccept,
                onCancel: onCancel
            )
        case .popover2:
            LaunchAlertView_Popover2(
                viewModel: viewModel,
                config: config,
                onAccept: onAccept,
                onCancel: onCancel
            )
        case .popover3:
            LaunchAlertView_Popover3(
                viewModel: viewModel,
                config: config,
                onAccept: onAccept,
                onCancel: onCancel
            )
        case .popover4:
            LaunchAlertView_Popover4(
                viewModel: viewModel,
                config: config,
                onAccept: onAccept,
                onCancel: onCancel
            )
        case .popover5:
            LaunchAlertView_Popover5(
                viewModel: viewModel,
                config: config,
                onAccept: onAccept,
                onCancel: onCancel
            )
        }
    }
    
    public static func getViewConfigWithStyle(style: LaunchAlertViewStyle, lang: CKLanguage) -> LaunchAlertViewConfig {
        switch style {
        case .fullscreen1:
            FullScreen1LaunchAlertViewConfig(lang: lang)
        case .popover1:
            Popover1LaunchAlertViewConfig(lang: lang)
        case .popover2:
            Popover2LaunchAlertViewConfig(lang: lang)
        case .popover3:
            Popover3LaunchAlertViewConfig(lang: lang)
        case .popover4:
            Popover4LaunchAlertViewConfig(lang: lang)
        case .popover5:
            Popover5LaunchAlertViewConfig(lang: lang)
        }
    }
}
