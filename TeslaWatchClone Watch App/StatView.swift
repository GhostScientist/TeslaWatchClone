//
//  StatView.swift
//  TeslaWatchClone
//
//  Created by Dakota Kim on 12/2/24.
//


import SwiftUI

struct StatView: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .font(.system(size: 10, weight: .regular))
                .foregroundColor(.gray)
            Text(value)
                .font(.system(size: 12, weight: .medium))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(8)
        .background(Color(white: 0.2))
        .cornerRadius(8)
    }
}
