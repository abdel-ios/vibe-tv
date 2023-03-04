//
//  LoopVideo.swift
//  Vibe-TV
//
//  Created by Abdel Baali on 04/03/23.
//

import SwiftUI
import AVFoundation

struct LoopVideo: UIViewRepresentable, View {
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LoopVideo>) {
    }

    func makeUIView(context: Context) -> UIView {
      return PlayerUIView(frame: .zero)
    }
  }


class PlayerUIView: UIView {
    private var playerLooper: AVPlayerLooper?
    private var playerLayer = AVPlayerLayer()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Load the resource
        let fileUrl = Bundle.main.url(forResource: "welcome-video-loop", withExtension: "mp4")!
        let asset = AVAsset(url: fileUrl)
        let item = AVPlayerItem(asset: asset)
        
        // Setup the player
        let player = AVQueuePlayer()
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)
        
        // Create a new player looper with the queue player and template item
        playerLooper = AVPlayerLooper(player: player, templateItem: item)
        
        // Start the movie
        player.play()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}
