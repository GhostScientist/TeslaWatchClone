//
//  LiveMonitorView.swift
//  TeslaWatchClone
//
//  Created by Dakota Kim on 12/2/24.
//


import SwiftUI
import AVFoundation
import _AVKit_SwiftUI

struct LiveMonitorView: View {
    @State private var selectedCamera = 0
    @State private var isRecording = false
    @State private var motionDetected = false
    @State private var lastMotion = "2m ago"
    @State private var player: AVPlayer
    
    let cameras = ["Front", "Rear", "Left", "Right"]
    let streams = [
        "https://demo.unified-streaming.com/k8s/features/stable/video/tears-of-steel/tears-of-steel.ism/.m3u8",
        "https://demo.unified-streaming.com/k8s/features/stable/video/tears-of-steel/tears-of-steel.ism/.m3u8",
        "https://demo.unified-streaming.com/k8s/features/stable/video/tears-of-steel/tears-of-steel.ism/.m3u8",
        "https://demo.unified-streaming.com/k8s/features/stable/video/tears-of-steel/tears-of-steel.ism/.m3u8"
    ]
    
    init() {
        let firstStreamURL = URL(string: "https://demo.unified-streaming.com/k8s/features/stable/video/tears-of-steel/tears-of-steel.ism/.m3u8")!
        _player = State(initialValue: AVPlayer(url: firstStreamURL))
    }
    
    @State private var isFullScreen = false
    @State private var isMuted = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 8) {
                    ZStack {
                        VideoPlayer(player: player)
                            .frame(height: 120)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
                            .onTapGesture {
                                isFullScreen = true
                            }
                        
                        VStack {
                            HStack {
                                if isRecording {
                                    Circle()
                                        .fill(Color.red)
                                        .frame(width: 8, height: 8)
                                        .overlay(
                                            Circle()
                                                .stroke(Color.red.opacity(0.3))
                                                .scaleEffect(motionDetected ? 2 : 1)
                                        )
                                        .animation(.easeInOut(duration: 1).repeatForever(), value: motionDetected)
                                }
                                
                                
                                Spacer()
                            }
                            .padding(8)
                            Spacer()
                        }
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(0..<cameras.count, id: \.self) { index in
                                Button(action: {
                                    switchCamera(to: index)
                                }) {
                                    Text(cameras[index])
                                        .font(.system(size: 12, weight: .medium))
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                        .background(selectedCamera == index ? Color.white.opacity(0.2) : Color.clear)
                                        .cornerRadius(12)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.horizontal, 4)
                    }
                    
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 8) {
                        StatView(title: "Last Motion", value: lastMotion)
                        StatView(title: "Recording", value: isRecording ? "Active" : "Standby")
                        StatView(title: "Stream Quality", value: "720p")
                        StatView(title: "Latency", value: "2.1s")
                    }
                    .padding(.horizontal, 4)
                    
                    HStack(spacing: 8) {
                        Button(action: {
                            isRecording.toggle()
                            if isRecording {
                                player.play()
                            } else {
                                player.pause()
                            }
                        }) {
                            Image(systemName: isRecording ? "record.circle.fill" : "record.circle")
                                .foregroundColor(isRecording ? .red : .white)
                                .font(.system(size: 24))
                        }
                        
                        Button(action: {
                            player.volume = isMuted ? 1 : 0
                            isMuted.toggle()
                        }) {
                            Image(systemName: isMuted ? "speaker.slash.fill" :"speaker.wave.2.fill")
                                .font(.system(size: 24))
                        }
                        
                        Button(action: {}) {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .font(.system(size: 24))
                                .foregroundColor(.yellow)
                        }
                    }
                    .padding(.top, 4)
                }
                .padding(8)
                .navigationBarTitleDisplayMode(.inline)
                .onAppear {
                    player.play()
                    
                    withAnimation {
                        motionDetected = true
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation {
                            motionDetected = false
                        }
                    }
                }
                .onDisappear {
                    player.pause()
                }
            }.fullScreenCover(isPresented: $isFullScreen) {
                FullScreenVideoView(player: player, isFullScreen: $isFullScreen)
            }
        }
    }
    
    private func switchCamera(to index: Int) {
        selectedCamera = index
        
        if let url = URL(string: streams[index]) {
            let playerItem = AVPlayerItem(url: url)
            player.replaceCurrentItem(with: playerItem)
            
            NotificationCenter.default.addObserver(forName: .AVPlayerItemNewAccessLogEntry, object: playerItem, queue: .main) { _ in
                player.play()
            }
            
            player.play()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                player.play()
            }
            
            withAnimation {
                motionDetected = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    motionDetected = false
                }
            }
        }
    }
}
