//
//  CustomFontModifier.swift
//  Pokey
//
//  Created by AlecNipp on 11/17/22.
//

import Foundation
import SwiftUI

struct PokeyFont: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("PKMN-RBYGSC", size: 12, relativeTo: .body))
    }
}

extension View {
    func pokeyFont() -> some View {
            modifier(PokeyFont())
        }
}
