//
//  File.swift
//  DynamicOverlay
//
//  Created by Leo Mehlig on 23.04.25.
//

import SwiftUI
import UIKit

extension EdgeInsets {
    var uiEdgeInsets: UIEdgeInsets {
        UIEdgeInsets(top: top, left: leading, bottom: bottom, right: trailing)
    }
}

extension UIEdgeInsets {
    @_disfavoredOverload
    static func with(top: CGFloat = 0,
                     left: CGFloat = 0,
                     bottom: CGFloat = 0,
                     right: CGFloat = 0) -> UIEdgeInsets {
        UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }

    static func + (lhs: UIEdgeInsets, rhs: UIEdgeInsets) -> UIEdgeInsets {
        UIEdgeInsets(top: lhs.top + rhs.top,
                     left: lhs.left + rhs.left,
                     bottom: lhs.bottom + rhs.bottom,
                     right: lhs.right + rhs.right)
    }

    static func - (lhs: UIEdgeInsets, rhs: UIEdgeInsets) -> UIEdgeInsets {
        UIEdgeInsets(top: lhs.top - rhs.top,
                     left: lhs.left - rhs.left,
                     bottom: lhs.bottom - rhs.bottom,
                     right: lhs.right - rhs.right)
    }
}

