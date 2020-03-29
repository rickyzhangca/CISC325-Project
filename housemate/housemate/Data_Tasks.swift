//
//  Data_Tasks.swift
//  housemate
//
//  Created by Ricky Zhang on 2020-03-28.
//  Copyright © 2020 CISC325 Group 10. All rights reserved.
//

import Foundation
import SwiftUI

struct Task : Identifiable {
    var id = UUID()
    var name: String
    var checkState: Bool = false
    var num_users: Int = 1
}
