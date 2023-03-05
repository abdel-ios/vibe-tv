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
        NavigationView{
            ZStack{
                VStack{
                    LoopVideo()
                        .frame(width: .infinity,height: 500)
                        .ignoresSafeArea()
                    
                    Spacer()
                }
                
                VStack(spacing: 45){
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 30){
                        Image("vibe-logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                        
                        Text("Watch all series and movies anywhere, anytime.")
                            .foregroundColor(.white)
                            .font(.system(size: 70,weight: .heavy))
                            .lineLimit(3)
                            .minimumScaleFactor(0.01)
                        
                    }
                    .padding(.horizontal, 20)
                    
                    //MARK: Login and Signup buttons
                    VStack(spacing: 20){
                        
                        // sign in button
                        NavigationLink {
                            SignUpScreen()
                        } label: {
                            PrimaryButton(label: "Start now")
                        }
                        
                        // login button
                        NavigationLink {
                            LoginScreen()
                        } label: {
                            SecondaryButton(label: "I already have an account")
                        }
                        
                        
                        Text("©2023 Vibe-TV Streaming app, based in Milan, all right are reserved.")
                            .foregroundColor(Color.white_30)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 10,weight: .regular))
                            .padding(.top,10)


                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom,20)
                    
                    
                }
                .background(
                    Image("gradient-welcome")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                )
                
                
                
            }
            .preferredColorScheme(.dark)
        }
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
            .previewDevice("iPhone 14 Pro")
        
        WelcomeScreen()
            .previewDevice("iPhone 13 mini")
    }
}

