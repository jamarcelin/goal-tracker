//
//  Card.swift
//  GoalTracker
//
//  Created by Josh Marcelin on 2/4/23.
//

import SwiftUI

struct Card: View {
    
    let goal: tempGoal

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image(systemName: goal.icon)
                    .resizable()
                    .colorInvert()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 75)
            }
            VStack {
                HStack {
                    Text(goal.goal)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    Spacer()
                }
                HStack {
                    Text(goal.startDate)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    Spacer()
                }
            }
            .padding(.bottom)
            
            VStack {
                HStack {
                    ProgressCircle(progress: ((Double(goal.completedAmount) * 100) / Double(goal.goalAmount) ), color: Color.white, text: "\(Int((Double(goal.completedAmount) * 100) / Double(goal.goalAmount)))%")
                        .padding(.horizontal)
                    Text("of \(goal.goalAmount) goal")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    Spacer()
                }
                HStack {
                    ProgressCircle(progress: 84.0, color: Color.white, text: "14")
                        .padding(.horizontal)
                    Text("averaged daily")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    Spacer()
                }
                
                Spacer()
                
            }
            
            
            Spacer()
            streakVisual(streak: 3)
        }
        .padding(25)
        .background(getGradient(gradientType: goal.gradientType, colors:[randomColor(), randomColor()]))
        .cornerRadius(20)
        .frame(height: 500)
        
    }
}

public func getGradient(gradientType: Int, colors: [Color]) -> some View {
    if gradientType == 1 {
        return AnyView(RadialGradient(gradient: Gradient(colors: [colors[0], .black]), center: .center, startRadius: 2, endRadius: 650))
    }
    return AnyView(LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing))
    
}

public func streakVisual(streak: Int) -> some View {
    HStack {
        ForEach(1...7, id:\.self) { i in
            if (i <= streak) {
                Image(systemName: "square.fill")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }
            else {
                Image(systemName: "square")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }
                            
                        }
        ForEach(0...0, id:\.self) { _ in
                            
                        }
    }
}

func randomColor() -> Color {
    let r = Double.random(in: 0...1)
    let g = Double.random(in: 0...1)
    let b = Double.random(in: 0...1)
    return Color(red: r, green: g, blue: b)
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(goal: tempGoal(orderNumber: 0, goal: "Complete 15 Push Ups", icon: "figure.core.training", startDate: "December 10, 2022", goalAmount: 10000, goalDaily: 15, day1: 15, day2: 15, day3: 15, day4: 0, day5: 0, day6: 0, day7: 0, lastAdded: Date(), gradientType: 1, completedAmount: 2000, streak: 3))
    }
}
