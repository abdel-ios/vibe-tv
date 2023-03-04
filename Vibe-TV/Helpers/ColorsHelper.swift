//
//  ColorsHelper.swift
//  Vibe-TV
//
//  Created by Abdel Baali on 04/03/23.
//

import Foundation
import SwiftUI

enum VibeColors: String {
    case white_10 = "white-10"
    case white_20 = "white-20"
    case white_30 = "white-30"
    case white_50 = "white-50"
    case white_70 = "white-70"
    case green_check = "green-check"
    case red_error = "red-error"
    case purple_primary = "purple-primary"
}

extension Color {
    public static var white_10 = Color(VibeColors.white_10.rawValue)
    public static var white_20 = Color(VibeColors.white_20.rawValue)
    public static var white_30 = Color(VibeColors.white_30.rawValue)
    public static var white_50 = Color(VibeColors.white_50.rawValue)
    public static var white_70 = Color(VibeColors.white_70.rawValue)
    public static var green_check = Color(VibeColors.green_check.rawValue)
    public static var red_error = Color(VibeColors.red_error.rawValue)
    public static var purple_primary = Color(VibeColors.purple_primary.rawValue)
}
