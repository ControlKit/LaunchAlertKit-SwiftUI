// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation
import SwiftUI
import Combine
import ControlKitBase
#if canImport(UIKit)
import UIKit
#endif

let launchAlertKit_Version: String = "1.0.0"
let latestLaunchAlertKey: String = "latestLaunchAlertResponseId"

public class LaunchAlertKit: Alertable {
    public let alertService: GenericServiceProtocol!
    public init(alertService: GenericServiceProtocol = GenericService()) {
        self.alertService = alertService
    }
    
    // SwiftUI version
    @MainActor
    public func configure(config: AlertServiceConfig) async -> LaunchAlertView? {
        do {
            let request = AlertRequest(appId: config.appId)
            guard let response = try await self.getAlert(request: request)?.value else {
                return nil
            }
            guard let id = response.data?.id, id > UserDefaults.standard.string(forKey: latestLaunchAlertKey) ?? String() else {
                return nil
            }
            let viewModel = DefaultLaunchAlertViewModel(serviceConfig: config, response: response)
            viewModel.saveLatestResponseId(id: id)
            return LaunchAlertView(viewModel: viewModel, config: config)
        } catch {
            return nil
        }
    }
}

// SwiftUI ViewModifier for easy integration
public struct LaunchAlertModifier: ViewModifier {
    let alertKit: LaunchAlertKit
    let config: AlertServiceConfig
    @State private var showAlert: Bool = false
    @State private var alertView: LaunchAlertView?
    
    var isPopover: Bool {
        config.viewConfig.style == .popover1 || config.viewConfig.style == .popover2
    }
    
    public func body(content: Content) -> some View {
        content
            .task {
                if let view = await alertKit.configure(config: config) {
                    await MainActor.run {
                        alertView = view
                        showAlert = true
                    }
                }
            }
            .modifier(AlertPresentationModifier(
                isPresented: $showAlert,
                alertView: alertView,
                isPopover: isPopover
            ))
    }
}

private struct AlertPresentationModifier: ViewModifier {
    @Binding var isPresented: Bool
    let alertView: LaunchAlertView?
    let isPopover: Bool
    
    func body(content: Content) -> some View {
        if isPopover {
            content
                .sheet(isPresented: $isPresented) {
                    if let alertView = alertView {
                        if #available(iOS 16.0, *) {
                            alertView
                                .presentationDetents([.large])
                                .presentationDragIndicator(.hidden)
                        } else {
                            alertView
                        }
                    }
                }
        } else {
            content
                .fullScreenCover(isPresented: $isPresented) {
                    if let alertView = alertView {
                        alertView
                    }
                }
        }
    }
}

public extension View {
    func launchAlert(alertKit: LaunchAlertKit, config: AlertServiceConfig) -> some View {
        modifier(LaunchAlertModifier(alertKit: alertKit, config: config))
    }
}
