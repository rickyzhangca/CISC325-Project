//
//  TasksView.swift
//  housemate
//
//  Created by Ricky Zhang on 2020-03-05.
//  Copyright © 2020 CISC325 Group 10. All rights reserved.
//

import SwiftUI

struct TasksView: View {
    var body: some View {
        ScrollView {
            HStack {
                Text("House Tasks")
                    .font(.largeTitle)
                Spacer()
            }

            VStack {
                HouseTaskView(checkState: false)
                HouseTaskView(checkState: false)
                HouseTaskView(checkState: false)
                HouseTaskView(checkState: false)
                
                ButtonView(text: "Add Task", textColor: Color.blue)
                    .padding(.trailing, 12.0)
                
                SectionHeaderView(text: "Completed")
                
                HouseTaskView(checkState: true)
                HouseTaskView(checkState: true)
                HouseTaskView(checkState: true)
                HouseTaskView(checkState: true)
            }
        }
        .padding(.leading, 16.0)
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}
