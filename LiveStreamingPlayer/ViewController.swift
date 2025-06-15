//
//  ViewController.swift
//  LiveStreamingPlayer
//
//  Created by User on 15/06/25.
//

import UIKit
import StreamingKit
class ViewController: UIViewController {
    private var videoPlayer = StreamingVideoPlayer()
    @IBOutlet weak var txtVideoURL: UITextField!
    @IBOutlet weak var videoView:UIView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpVideoView()
    }
    
    
    
    @IBAction func didtapPlayBtn(_ sender : UIButton) {
        // Example working url : https://live-hls-web-aje.getaj.net/AJE/01.m3u8

        guard let url = URL(string: txtVideoURL.text ?? "") else {
            print("Invaild url or empty")
            return
        }
        videoPlayer.play(url: url)
    }
    @IBAction func didtapPauseBtn(_ sender : UIButton) {
        videoPlayer.pause()
    }
    @IBAction func didtapClearBtn(_ sender : UIButton) {
        txtVideoURL.text = ""
        videoPlayer.pause()
    }

    // MARK: Setup Video View
    
    private func setUpVideoView() {
        videoPlayer.add(to: videoView)
    }

}

