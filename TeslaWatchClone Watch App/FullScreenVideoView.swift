//
//  FullScreenVideoView.swift
//  TeslaWatchClone
//
//  Created by Dakota Kim on 12/2/24.
//
import SwiftUI
import AVFoundation
import _AVKit_SwiftUI

struct FullScreenVideoView: View {
    let player: AVPlayer
    @Binding var isFullScreen: Bool
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VideoPlayer(player: player)
                .edgesIgnoringSafeArea(.all)
        }
        .edgesIgnoringSafeArea(.all)
    }
}
