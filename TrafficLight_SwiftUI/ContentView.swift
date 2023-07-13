//
//  ContentView.swift
//  TrafficLight_SwiftUI
//
//  Created by Aleksandr Mamlygo on 12.07.23.
//

import SwiftUI

enum TrafficLightState {
    case red
    case yellow
    case green
}

struct ContentView: View {
    @State private var isLightStarted = false
    @State private var activeLight: TrafficLightState?
    
    var body: some View {
        VStack {
            ColorCircleView(color: .red, opacityValue: activeLight == .red ? 1 : 0.5)
            ColorCircleView(color: .yellow, opacityValue: activeLight == .yellow ? 1 : 0.5)
            ColorCircleView(color: .green, opacityValue: activeLight == .green ? 1 : 0.5)
            
            Button(action: nextLight) {
                Text(isLightStarted ? "NEXT" : "START")
                    .font(.title)
                    .padding()
            }
            .background(Color.accentColor)
            .foregroundColor(.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.white, lineWidth: 2)
            )
            .padding(EdgeInsets(top: 100, leading: 0, bottom: 50, trailing: 0))
            
        }
        .padding()
    }
    
    private func nextLight() {
        if !isLightStarted {
            isLightStarted.toggle()
        }
        
        switch activeLight {
        case .none:
            activeLight = .red
        case .some(let color):
            switch color {
            case .red:
                activeLight = .yellow
            case .yellow:
                activeLight = .green
            case .green:
                activeLight = .red
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
