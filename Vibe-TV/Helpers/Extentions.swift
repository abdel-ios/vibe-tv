//
//  Extentions.swift
//  Vibe-TV
//
//  Created by Abdel Baali on 05/03/23.
//

import Foundation
import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
