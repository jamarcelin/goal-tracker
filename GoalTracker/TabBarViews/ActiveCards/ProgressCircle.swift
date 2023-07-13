//
//  ProgressCircle.swift
//  GoalTracker
//
//  Created by Josh Marcelin on 2/4/23.
//

import SwiftUI

struct ProgressCircle: View {
    
    let progress: Double
    let color: Color
    let text: String
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0.0, to: CGFloat(0.75))
                .stroke(style: StrokeStyle(lineWidth: 9, lineCap: .round, lineJoin: .round))
                .foregroundColor(color.opacity(0.2))
                .rotationEffect(Angle(degrees: 135))
            Circle()
                .trim(from: 0.0, to: CGFloat(min(0.75, progress * 0.0075)))
                .stroke(style: StrokeStyle(lineWidth: 9, lineCap: .round, lineJoin: .round))
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: 135))
            Text(text)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(color)
        }
        .frame(width: 75, height: 75)
    }
}

struct ProgressCircle_Previews: PreviewProvider {
    static var previews: some View {
        ProgressCircle(progress: 10.0, color: Color.blue, text: "10%")
    }
}
