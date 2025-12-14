//
//  LaunchAlertView.swift
//  
//
//  Created by Maziar Saadatfar on 10/21/23.
//

import SwiftUI
import ControlKitBase

public struct LaunchAlertView: View {
    let viewModel: LaunchAlertViewModel
    let config: AlertServiceConfig
    @Environment(\.dismiss) var dismiss
    
    private var presenterConfig: LaunchAlertViewConfig {
        let updatedConfig = config.viewConfig
        let presenter = LaunchAlertViewPresenter(data: viewModel.response.data, config: updatedConfig)
        return presenter.config
    }
    
    public init(viewModel: LaunchAlertViewModel, config: AlertServiceConfig) {
        self.viewModel = viewModel
        self.config = config
    }
    
    public var body: some View {
        LaunchAlertViewStyle.make(
            viewModel: viewModel,
            config: presenterConfig,
            onAccept: {
                viewModel.setAction(.accepted)
                dismiss()
            },
            onCancel: {
                viewModel.setAction(.canceled)
                dismiss()
            }
        )
        .onAppear {
            viewModel.setAction(.view)
        }
    }
}

