//
//  ActiveOverlayAreaViewModifier.swift
//  DynamicOverlay
//
//  Created by Gaétan Zanella on 28/12/2020.
//  Copyright © 2020 Fabernovel. All rights reserved.
//

import SwiftUI

import SwiftUIIntrospect

extension String {
    static let scrollViewIdentifier: String = "drivingScrollView"
}

struct ActiveOverlayAreaViewModifier<Key: PreferenceKey>: ViewModifier where Key.Value == ActivatedOverlayArea {

    let key: Key.Type
    let isActive: Bool

    func body(content: Content) -> some View {
        content.background(
            GeometryReader { proxy in
                Spacer().preference(
                    key: key,
                    value: isActive ? .active(proxy.frame(in: .overlay)) : .inactive()
                )
            }
        )
        .introspect(.scrollView, on: .iOS(.v16, .v17, .v18)) { (scrollView: UIScrollView) in
            scrollView.accessibilityIdentifier = String.scrollViewIdentifier
        }
    }
}
