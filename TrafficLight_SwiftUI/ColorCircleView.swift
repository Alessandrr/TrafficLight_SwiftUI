//
//  ColorCircleView.swift
//  TrafficLight_SwiftUI
//
//  Created by Aleksandr Mamlygo on 12.07.23.
//

import SwiftUI

struct ColorCircleView: View {
    let color: Color
    var isActive: Bool
    
    var body: some View {
        Circle()
            .foregroundColor(color)
            .overlay(Circle().stroke(Color.primary, lineWidth: 5))
            .padding()
            .shadow(color: Color.primary, radius: 10)
            .opacity(isActive ? 1 : 0.5)
    }
}

struct ColorCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ColorCircleView(color: .red, isActive: true)
    }
}
