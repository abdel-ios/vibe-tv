//
//  WelcomeScreen.swift
//  Vibe-TV
//
//  Created by Abdel Baali on 04/03/23.
//

import SwiftUI
import AVFoundation

struct WelcomeScreen: View {
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            
            VStack{
                LoopVideo()
                    .frame(width: .infinity, height: 500)
                    .ignoresSafeArea()
                
                Spacer()
            }
            
            
        }
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}

