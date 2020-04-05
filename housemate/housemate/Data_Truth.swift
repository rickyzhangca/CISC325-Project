//
//  Truth.swift
//  housemate
//
//  Created by Ricky Zhang on 2020-03-29.
//  Copyright © 2020 CISC325 Group 10. All rights reserved.
//

import Foundation
import SwiftUI

class SourceOfTruth: ObservableObject{
    @Published var Data_Housemates: [Housemate] = [
        Housemate(name: "Alice Bob", icon:"moon.circle.fill"),
        Housemate(name: "Celine Dave", icon:"bolt.circle.fill"),
        Housemate(name: "Eva Fil", icon:"heart.circle.fill"),
    ]
    
    @Published var Data_Announcements: [Announcement] = [
        Announcement(text: "Welcome to 123 Paris Hill st everyone!", check_status: false, made_by:"Alice Bob", icon:"moon.circle.fill"),
        Announcement(text: "The landlord told us to tranfer the rent at the beginning of each month so I've set it up in the bill tab!", check_status: false, made_by:"Celine Dave", icon:"bolt.circle.fill"),
        Announcement(text: "Testing this new app", check_status: true, made_by:"Eva Fil", icon:"heart.circle.fill"),
    ]
    
    @Published var Data_Tasks: [Task] = [
        Task(name: "Sweep floors", checkState: false, num_users: 1, icons: ["moon.circle.fill"]),
        Task(name: "Take out garbage!", checkState: false, num_users: 3, icons: ["moon.circle.fill", "bolt.circle.fill", "heart.circle.fill"]),
        Task(name: "Clean up the mess Andrew made!", checkState: true, num_users: 2, icons: ["moon.circle.fill", "bolt.circle.fill"]),
    ]
    @Published var Data_Tasks_ttt: [String:Task] = [
        "Sweep floors":Task(name: "Sweep floors", checkState: false, num_users: 1, icons: ["moon.circle.fill"]),
        "Take out garbage":Task(name: "Take out garbage!", checkState: false, num_users: 3, icons: ["moon.circle.fill", "bolt.circle.fill", "heart.circle.fill"]),
        "Clean up the mess Andrew made!":Task(name: "Clean up the mess Andrew made!", checkState: true, num_users: 2, icons: ["moon.circle.fill", "bolt.circle.fill"]),
     ]
    
    @Published var Selecter_Count_Names: [String] = []
    @Published var Selecter_Count: [String] = []
    
    @Published var Data_House = House(address: "123 Paris Hill St")
    
    @Published var Data_Payments: [Payment] = [
        Payment(name: "June Rent", amount: 700, recurring: "Monthly", num_users_to_pay: 3, num_users_paid: 1, due_date: "Jun 1, 2020", users_names_to_pay:["Alice Bob","Celine Dave"], users_names_paid: ["Eva Fil"], users_icons_to_pay:["moon.circle.fill","bolt.circle.fill"], users_icons_paid:["heart.circle.fill"]),
        Payment(name: "July Rent", amount: 700, recurring: "Monthly", num_users_to_pay: 3, num_users_paid: 0, due_date: "Jul 1, 2020",users_names_to_pay:["Alice Bob","Celine Dave","Eva Fil"], users_names_paid: [], users_icons_to_pay:["moon.circle.fill","bolt.circle.fill","heart.circle.fill"], users_icons_paid:[]),
        Payment(name: "Toilet Paper", amount: 5, recurring: "Split Bill $10 -> $5", num_users_to_pay: 2, num_users_paid: 0, due_date: "Aug 2, 2020",users_names_to_pay:["Celine Dave","Eva Fil"], users_names_paid: [], users_icons_to_pay:["bolt.circle.fill","heart.circle.fill"], users_icons_paid:[]),
        Payment(name: "Kicthen Supplies", amount: 0, recurring: "Split Bill $20 -> $10", num_users_to_pay: 2, num_users_paid: 2, due_date: "Aug 2, 2020",users_names_to_pay:[], users_names_paid: ["Celine Dave","Eva Fil"], users_icons_to_pay:[], users_icons_paid:["bolt.circle.fill","heart.circle.fill"])
    ]
    
    func CreateNewPayment(n: String, a: Double, r: String, nutp: Int, nup: Int, untp:[String], unp:[String], uitp:[String], uip:[String]) {
        
        let b = String(format: "%.2f", a)
        let c = Double(b)
        
        Data_Payments.append(Payment(name: n, amount: c ?? 0.0, recurring: r, num_users_to_pay: nutp, num_users_paid: nup, users_names_to_pay:untp, users_names_paid:unp, users_icons_to_pay:uitp, users_icons_paid:uip))
    }
    func CreateNewAnnouncement(t:String, c:Bool, m:String, i:String) {
        Data_Announcements.append(Announcement(text: t, check_status: c, made_by: m, icon: i))
    }
    func CreateNewTask(n: String, nu: Int, ics: [String]) {
        Data_Tasks.append(Task(name: n, checkState: false, num_users: nu, icons: ics))
    }
    func Convert(d: Double) -> String {
        return String(format: "%.2f", d)
    }
}
