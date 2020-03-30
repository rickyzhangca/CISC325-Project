//
//  Truth.swift
//  housemate
//
//  Created by Ricky Zhang on 2020-03-29.
//  Copyright © 2020 CISC325 Group 10. All rights reserved.
//

import Foundation

class SourceOfTruth: ObservableObject{
    @Published var Data_Housemates: [Housemate] = [
        Housemate(name: "Alice Bob"),
        Housemate(name: "Celine Dave"),
        Housemate(name: "Eva Fil"),
    ]
    
    @Published var Data_Announcements: [Announcement] = [
        Announcement(text: "Welcome to 123 Paris Hill st everyone!"),
        Announcement(text: "The landlord told us to tranfer the rent at the beginning of each month so I've set it up in the bill tab!"),
    ]
    
    @Published var Data_Tasks: [Task] = [
        Task(name: "test task 1!", checkState: false, num_users: 1),
        Task(name: "test task 2!", checkState: false, num_users: 3),
        Task(name: "test task 3!", checkState: true, num_users: 2),
    ]
    
    @Published var Selecter_Count: Int = 0
    
    @Published var Data_House = House(address: "123 Paris Hill St")
    
    @Published var Data_Payments: [Payment] = [
        Payment(name: "June Rent", amount: 700, recurring: "Monthly", num_users_to_pay: 3, num_users_paid: 1, due_date: "Jun 1, 2020"),
        Payment(name: "July Rent", amount: 700, recurring: "Monthly", num_users_to_pay: 3, num_users_paid: 0, due_date: "Jul 1, 2020"),
        Payment(name: "Toilet Paper", amount: 5, recurring: "Split Bill $10 -> $5", num_users_to_pay: 2, num_users_paid: 0, due_date: "Aug 2, 2020"),
    ]
    
    func CreateNewPayment(n: String, a: Int, r: String, nutp: Int, nup: Int) {
        Data_Payments.append(Payment(name: n, amount: a, recurring: r, num_users_to_pay: nutp, num_users_paid: nup))
    }
    func CreateNewAnnouncement(t: String) {
        Data_Announcements.append(Announcement(text: t))
    }
    func CreateNewTask(n: String, nu: Int) {
        Data_Tasks.append(Task(name: n, checkState: false, num_users: nu))
    }
}
