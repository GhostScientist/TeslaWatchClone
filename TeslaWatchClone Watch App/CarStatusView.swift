//
//  CarStatusView.swift
//  TeslaWatchClone
//
//  Created by Dakota Kim on 12/2/24.
//


import SwiftUI

struct CarStatusView: View {
    let carModel: String
    let range: Int
    let status: String
    
    var body: some View {
        NavigationView {
            VStack(spacing: 12) {
                Text(carModel)
                    .font(.system(.body, design: .rounded))
                    .padding(.top, 12)
                    .foregroundColor(.gray)
                
                Image("tesla-nobg")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 70)
                
                Text(status)
                    .font(.system(.body, design: .rounded))
                    .foregroundColor(.gray)
                
                ZStack {
                    Circle()
                        .trim(from: 0, to: 0.75)
                        .stroke(Color.green.opacity(0.3), lineWidth: 2)
                        .frame(width: 32, height: 32)
                        .rotationEffect(.degrees(135))
                    
                    Circle()
                        .trim(from: 0, to: CGFloat(range) / 400)
                        .stroke(Color.green, lineWidth: 2)
                        .frame(width: 32, height: 32)
                        .rotationEffect(.degrees(135))
                    
                    VStack(spacing: -2) {
                        Text("\(range)")
                            .font(.system(size: 12, weight: .medium, design: .rounded))
                        Text("mi")
                            .font(.system(size: 10, weight: .regular, design: .rounded))
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        // Menu action
                    } label: {
                        Image(systemName: "list.bullet")
                            .foregroundColor(.gray)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                    } label: {
                        Image(systemName: "lock.fill")
                            .foregroundColor(.gray)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack(spacing: 0) {
                        Button {
                        } label: {
                            Image(systemName: "car.fill")
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        Button {
                        } label: {
                            Image(systemName: "fanblades.fill")
                                .foregroundColor(.gray)
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
    }
}
