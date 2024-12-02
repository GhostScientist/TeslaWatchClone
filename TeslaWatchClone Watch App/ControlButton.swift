//
//  ControlButton.swift
//  TeslaWatchClone
//
//  Created by Dakota Kim on 12/2/24.
//
import SwiftUI

struct ControlButton: View {
    let icon: String
    let label: String
    
    var body: some View {
        Button {
            // Control action
        } label: {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                Text(label)
                    .font(.system(size: 10, weight: .medium, design: .rounded))
                    .foregroundColor(.white.opacity(0.8))
            }
            .frame(height: 70)
            .frame(maxWidth: .infinity)
            .background(Color(white: 0.2))
            .cornerRadius(12)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
