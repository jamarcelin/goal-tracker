//
//  Home.swift
//  GoalTracker
//
//  Created by Josh Marcelin on 2/4/23.
//

import Foundation
import SwiftUI

struct Home: View {
    
    @State private var selectedIndex = 0
    @State private var goals = makeTempGoals()
    
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Active Cards")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text(getTodayString())
                        .font(.headline)
                        .frame(alignment: .leading)
                }
                Spacer()
                Text("11")
                    .font(.title)
                    .fontWeight(.bold)
                Image(systemName: "flame.circle.fill")
                    .resizable()
                    .frame(width: 35, height: 35)
            }
            .padding(.top)
            .padding(.horizontal)
            TabView(selection: $selectedIndex) {
                ForEach(goals, id: \.self) { goal in
                        Card(goal: goal)
                            .padding(.horizontal)
                            .frame(width: UIScreen.main.bounds.width - 8)
                            .shadow(color: Color.black.opacity(0.75), radius: 5, x: 0, y: 5)
                            .tag(goal.orderNumber)
                }
                   
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 550)
            Button(action: stampToday) {
                Text("Here")
            }
            Spacer()
        }
    }
    func stampToday() -> Void {
        //goals[selectedIndex].lastAdded = Date()
        goals[selectedIndex].streak += 1
    }
}

func makeTempGoals() -> [tempGoal] {
    let calendar = Calendar.current
    let yesterday = calendar.date(byAdding: .day, value: -1, to: Date())!
    return [tempGoal(orderNumber: 0, goal: "Framework Development", icon: "laptopcomputer", startDate: "December 10, 2022", goalAmount: 50, goalDaily: 1, day1: 1, day2: 1, day3: 1, day4: 0, day5: 0, day6: 0, day7: 0, lastAdded: yesterday, gradientType: 1, completedAmount: 3, streak: 3), tempGoal(orderNumber: 0, goal: "Complete 15 Push Ups", icon: "figure.core.training", startDate: "December 10, 2022", goalAmount: 10000, goalDaily: 15, day1: 15, day2: 15, day3: 15, day4: 0, day5: 0, day6: 0, day7: 0, lastAdded: yesterday, gradientType: 1, completedAmount: 1001, streak: 3), tempGoal(orderNumber: 1, goal: "Run 2 Miles ", icon: "figure.run", startDate: "December 24, 2022", goalAmount: 100, goalDaily: 2, day1: 2, day2: 2, day3: 2, day4: 2, day5: 2, day6: 0, day7: 0, lastAdded: yesterday, gradientType: 1, completedAmount: 48, streak: 5)]
}



public func getTodayString() -> String {
    let today = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMMM dd, yyyy"
    return dateFormatter.string(from: today)
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

