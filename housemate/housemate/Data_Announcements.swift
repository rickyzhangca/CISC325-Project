//
//  Data_Announcements.swift
//  housemate
//
//  Created by Ricky Zhang on 2020-03-28.
//  Copyright © 2020 CISC325 Group 10. All rights reserved.
//

import Foundation
import SwiftUI

struct Announcement : Identifiable {
    var id = UUID()
    var text: String
    var check_status: Bool
    var made_by: String
    var icon: String
}
