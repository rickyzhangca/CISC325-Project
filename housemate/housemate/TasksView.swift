//
//  TasksView.swift
//  housemate
//
//  Created by Ricky Zhang on 2020-03-05.
//  Copyright © 2020 CISC325 Group 10. All rights reserved.
//

import SwiftUI

struct TasksView: View {
    
    @EnvironmentObject var truth: SourceOfTruth
    
    @State var toadd: String = ""
    
    var body: some View {
        ScrollView {
            HStack {
                Text("House Tasks")
                    .font(.largeTitle)
                Spacer()
            }

            VStack {
                ForEach(truth.Data_Tasks) { t in
                    if t.checkState == false{
                        HouseTaskView(checkState: t.checkState, task: t.name, num_users: t.num_users)
                    }
                }
                
                SectionHeaderView(text: "New Task")
                VStack {
                    VStack {
                        TextField("New Task", text: $toadd)
                        .padding(.all, 16.0)
                        .border(Color.gray, width: 2)
                    }
                    .padding(.trailing, 16.0)
                    .padding(.bottom, 8)
                    
                    ForEach(truth.Data_Housemates) { h in
                        HousemateSelectorView(checkState: h.checked, name: h.name)
                    }
                    
                    Button(
                        action:{
                            if self.toadd != "" {
                                self.truth.CreateNewTask(n: self.toadd, nu: self.truth.Selecter_Count)
                                self.truth.Selecter_Count = 0
                                self.toadd = ""
                            }
                    })
                    {
                        Text("Add to Task List")
                            .frame(minWidth: 0, maxWidth: .infinity)
                    }
                    .padding([.leading, .bottom], 0.0)
                    .padding(.trailing, 16.0)
                    .padding(.top, 8)
                    .buttonStyle(MyButtonStyle(color: .blue))
                }
                
                SectionHeaderView(text: "Completed Tasks")
                ForEach(truth.Data_Tasks) { t in
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
        TasksView().environmentObject(SourceOfTruth())
    }
}
