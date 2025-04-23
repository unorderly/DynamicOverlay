//
//  File.swift
//  DynamicOverlay
//
//  Created by Leo Mehlig on 23.04.25.
//

import SwiftUI
import OverlayContainer

class OverlayContainerViewControllerSafeArea: OverlayContainerViewController {
    var outsideSafeAreaInsets: UIEdgeInsets = .zero {
        didSet {
            self.updateAddtionalSafeAreaInsets()
        }
    }

    func updateAddtionalSafeAreaInsets() {
        let safeAreaInset = self.view.safeAreaInsets - self.additionalSafeAreaInsets
        let additionalSafeAreaInsets = self.outsideSafeAreaInsets - safeAreaInset
        if additionalSafeAreaInsets != self.additionalSafeAreaInsets {
            self.additionalSafeAreaInsets = additionalSafeAreaInsets
            print("OutsideSafeArea:", self.outsideSafeAreaInsets)
            print("Addtional Safe Area:", self.additionalSafeAreaInsets)
            print("Safe Area:", self.view.safeAreaInsets)
        }
    }

    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        self.updateAddtionalSafeAreaInsets()
    }

}

