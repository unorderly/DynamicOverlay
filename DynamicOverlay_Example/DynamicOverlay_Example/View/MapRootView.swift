//
//  MapRootView.swift
//  DynamicOverlay_Example
//
//  Created by Gaétan Zanella on 17/04/2021.
//  Copyright © 2021 Fabernovel. All rights reserved.
//

import Foundation
import SwiftUI
import DynamicOverlay

enum Notch: CaseIterable, Equatable {
    case min, max
}

struct MapRootView: View {

    struct State {
        var notch: Notch = .min
        var isEditing = false
        var progress = 0.0
    }

    @SwiftUI.State
    private var state = State()

    // MARK: - View

    var body: some View {
        GeometryReader { proxy in
            background
                .safeAreaPadding(proxy.safeAreaInsets)
                .dynamicOverlay(overlay
                    .safeAreaPadding(proxy.safeAreaInsets))
                .dynamicOverlayBehavior(behavior)
                .ignoresSafeArea()
        }
            .safeAreaInset(edge: .bottom, alignment: .center, spacing: 20) {
                Color.red.frame(height: 40)
            }
    }

    // MARK: - Private

    private var behavior: some DynamicOverlayBehavior {
        MagneticNotchOverlayBehavior<Notch> { notch in
            switch notch {
            case .max:
                return .fractional(0.8)
            case .min:
                return .fractional(0.3)
            }
        }
        .disable(.min, state.isEditing)
        .notchChange($state.notch)
        .onTranslation { translation in
            state.progress = translation.progress
        }
    }

    private var background: some View {
        ZStack {
            MapView()
            BackdropView().opacity(state.progress)
        }
        .ignoresSafeArea()
    }

    private var overlay: some View {
        OverlayView { event in
            switch event {
            case .didBeginEditing:
                state.isEditing = true
                withAnimation { state.notch = .max }
            case .didEndEditing:
                state.isEditing = false
                withAnimation { state.notch = .min }
            }
        }
        .drivingScrollView()
    }
}
