//
//  Data_Payments.swift
//  housemate
//
//  Created by Ricky Zhang on 2020-03-28.
//  Copyright © 2020 CISC325 Group 10. All rights reserved.
//

import Foundation
import SwiftUI

struct Payment : Identifiable {
    var id = UUID()
    var name: String
    var amount: Double = 1.0
    var recurring: String = ""
    var num_users_to_pay: Int = 1
    var num_users_paid: Int = 1
    var due_date: String = "Jan 1, 2020"
    
    var users_names_to_pay: [String] = ["A"]
    var users_names_paid: [String] = ["B"]
    var users_icons_to_pay: [String] = ["person"]
    var users_icons_paid: [String] = ["person.fill"]
}
