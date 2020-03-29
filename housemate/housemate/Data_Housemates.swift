//
//  Data_Housemates.swift
//  housemate
//
//  Created by Ricky Zhang on 2020-03-28.
//  Copyright © 2020 CISC325 Group 10. All rights reserved.
//

import Foundation
import SwiftUI

struct Housemate : Identifiable {
    var id = UUID()
    var name: String
    var checked: Bool = false
}
