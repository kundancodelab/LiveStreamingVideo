//
//  StreamingVideoPlayer.swift
//  StreamingKit
//
//  Created by User on 15/06/25.
//



import Foundation
import AVKit
import AVFoundation

public  class StreamingVideoPlayer{
    private let PlayerViewController =  AVPlayerViewController()
    private let avPlayer = AVPlayer()
    private lazy var playerView: UIView = {
       let view = PlayerViewController.view!
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public init(){}
    
    // MARK: Public interface
    
    public func play(url:URL) {
        let asset = AVURLAsset(url: url)
        let playerItem = AVPlayerItem(asset: asset)
        avPlayer.replaceCurrentItem(with: playerItem)
        PlayerViewController.player = avPlayer
        PlayerViewController.player?.play()
    }
    public func pause() {
        avPlayer.pause()
    }
  
    
    public func add(to view: UIView) {
        view.addSubview(playerView)
        NSLayoutConstraint.activate([
            playerView.topAnchor.constraint(equalTo: view.topAnchor),
            playerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            playerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            playerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
           
        ])
        
    }
}
