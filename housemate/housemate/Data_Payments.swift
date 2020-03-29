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
    var amount: Int = 1
    var recurring: String = ""
    var num_users_to_pay: Int = 4
    var num_users_paid: Int = 1
    var due_date: String = "Jan 1, 2020"
}
