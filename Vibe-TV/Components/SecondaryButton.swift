//
//  SecondaryButton.swift
//  Vibe-TV
//
//  Created by Abdel Baali on 05/03/23.
//

import SwiftUI

struct SecondaryButton: View {
    var label: String
    
    var body: some View {
        HStack{
            Text(label)
                .foregroundColor(Color.white_30)
                .font(.system(size: 16,weight: .semibold))
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 2)
                .foregroundColor(Color.white_20)
        )
        
    }
}
