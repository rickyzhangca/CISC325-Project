//
//  TasksView.swift
//  housemate
//
//  Created by Ricky Zhang on 2020-03-05.
//  Copyright © 2020 CISC325 Group 10. All rights reserved.
//

import SwiftUI

struct TasksView: View {
    var tasks: [Task] = []
    
    var body: some View {
        ScrollView {
            HStack {
                Text("House Tasks")
                    .font(.largeTitle)
                Spacer()
            }

            VStack {
                ForEach(tasks) { t in
                    if t.checkState == false{
                        HouseTaskView(checkState: t.checkState, task: t.name, num_users: t.num_users)
                    }
                }
                
                ButtonView(text: "Add Task", textColor: Color.blue)
                    .padding(.trailing, 12.0)
                
                SectionHeaderView(text: "Completed")
                
                ForEach(tasks) { t in
                    if t.checkState == true{
                        HouseTaskView(checkState: t.checkState, task: t.name, num_users: t.num_users)
                    }
                }
            }
        }
        .padding(.horizontal, 16.0)
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}
