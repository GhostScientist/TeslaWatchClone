//
//  ContentView.swift
//  TeslaWatchClone Watch App
//
//  Created by Dakota Kim on 12/2/24.
//

import SwiftUI
import AVFoundation
import _AVKit_SwiftUI

struct ContentView: View {
    let carModel = "Model S"
    let range = 320
    let status = "Parked"
    
    var body: some View {
        TabView {
            CarStatusView(carModel: carModel, range: range, status: status)
            CarControlsView()
            LiveMonitorView()
        }
        .tabViewStyle(.carousel)
    }
}

#Preview {
    ContentView()
}
