//
//  LottieView.swift
//  Vibe-TV
//
//  Created by Abdel Baali on 04/03/23.
//

import Foundation
import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable{
    typealias UIViewType = UIView
    var filename: String
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIViewType(frame: .zero)
        
        let animationView = LottieAnimationView()
        let animation = LottieAnimation.named(filename)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        
        ])
        
        return view
        
        
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        
    }
    
    
    
    
}
