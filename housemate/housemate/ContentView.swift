//
//  ContentView.swift
//  housemate
//
//  Created by Ricky Zhang on 2020-03-02.
//  Copyright © 2020 CISC325 Group 10. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabBar().environmentObject(SourceOfTruth())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SourceOfTruth())
    }
}
