//
//  PrimaryButton.swift
//  Vibe-TV
//
//  Created by Abdel Baali on 05/03/23.
//

import SwiftUI

struct PrimaryButton: View {
    var label: String
    
    var body: some View {
        HStack{
            Text(label)
                .foregroundColor(.white)
                .font(.system(size: 16,weight: .semibold))
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
        .background(Color.purple_primary)
        .cornerRadius(10)
        
    }
}

