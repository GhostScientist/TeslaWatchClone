//
//  CarControlsView.swift
//  TeslaWatchClone
//
//  Created by Dakota Kim on 12/2/24.
//


import SwiftUI

struct CarControlsView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                Grid(alignment: .center, horizontalSpacing: 8, verticalSpacing: 8) {
                    GridRow {
                        ControlButton(icon: "key.fill", label: "Start")
                        ControlButton(icon: "fanblades.fill", label: "Climate")
                    }
                    GridRow {
                        ControlButton(icon: "bolt.fill", label: "Charging")
                        ControlButton(icon: "horn.fill", label: "Horn")
                    }
                }
                .padding(8)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
