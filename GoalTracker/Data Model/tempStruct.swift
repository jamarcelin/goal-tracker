//
//  tempStruct.swift
//  GoalTracker
//
//  Created by Josh Marcelin on 2/5/23.
//

import SwiftUI

struct tempGoal: Decodable, Hashable {
    
    var orderNumber: Int32
    var goal: String
    var icon: String
    var startDate: String
    var goalAmount: Int
    var goalDaily: Int
    var day1: Int
    var day2: Int
    var day3: Int
    var day4: Int
    var day5: Int
    var day6: Int
    var day7: Int
    var lastAdded: Date
    var gradientType: Int
    var completedAmount: Int
    var streak: Int
}
