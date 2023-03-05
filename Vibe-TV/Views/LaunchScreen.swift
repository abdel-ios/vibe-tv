//
//  ContentView.swift
//  Vibe-TV
//
//  Created by Abdel Baali on 04/03/23.
//

import SwiftUI

struct LaunchScreen: View {
    @State private var isActive: Bool = false
    
    var body: some View {
        if isActive{
            WelcomeScreen()
        }else{
            ZStack {
                Color.black.ignoresSafeArea()
                
                LottieView(filename: "vibe-tv")
                    .frame(width: 200, height: 200)
            }
            .preferredColorScheme(.dark)
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation {
                        self.isActive =  true
                    }
                }
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
