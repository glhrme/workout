//
//  Font+Extension.swift
//  workout
//
//  Created by Guilherme dos Santos on 26/04/23.
//

import UIKit

enum CustomFonts: String {
    case light = "Poppins-Light"
    case extraLight = "Poppins-ExtraLight"
    case bold = "Poppins-Bold"
    case medium = "Poppins-Medium"
    case regular = "Poppins-Regular"
    case semiBold = "Poppins-SemiBold"
    case thin = "Poppins-Thin"
}

extension UIFont {
    static func usePoppins(_ font: CustomFonts, size: CGFloat) -> UIFont? {
        return UIFont(name: font.rawValue, size: size)
    }
}
