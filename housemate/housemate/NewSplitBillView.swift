//
//  NewSplitBillView.swift
//  housemate
//
//  Created by Ricky Zhang on 2020-03-06.
//  Copyright © 2020 CISC325 Group 10. All rights reserved.
//

import SwiftUI

struct NewSplitBillView: View {
    @State var toSplit: String = ""
    var body: some View {
        ScrollView {
            HStack {
                Text("New Split Bill")
                    .font(.largeTitle)
                    .padding(.bottom, 24.0)
                Spacer()
            }

            VStack {
                HStack {
                    Text("What are you splitting?")
                    Spacer()
                }
                TextField("Pizza?", text: $toSplit)
                    .padding([.top, .leading, .bottom], 12.0)
                    .border(Color.gray, width: 2)
                
                HStack {
                    HStack {
                        Text("Amount")
                        Spacer()
                    }
                    TextField("Pizza?", text: $toSplit)
                        .padding([.top, .leading, .bottom], 12.0)
                        .border(Color.gray, width: 2)
                    
                }
                .padding(.bottom, 24.0)
                
                HousemateSelectorView(checkState: true, name: "Ethan Ford")
                HousemateSelectorView(checkState: false)
                HousemateSelectorView(checkState: false, name: "Celine Devin")
            }
            .padding(.trailing, 16.0)
            .padding(.bottom, 16.0)
            
            NavigationLink(destination: BillView()) {
                ButtonView(text: "Post", textColor: Color.blue)
            }
            .foregroundColor(Color.black)
            .padding(.trailing, 16.0)
        }
        .padding(.leading, 16.0)
    }
}

struct NewSplitBillView_Previews: PreviewProvider {
    static var previews: some View {
        NewSplitBillView()
    }
}

struct HousemateSelectorView: View {
    @State var checkState:Bool = false;
    @State var name:String = "Alice Bob";
    var body: some View {
        Button(action:
            {
                self.checkState = !self.checkState
                print("State : \(self.checkState)")
            }
         )
         {
            HStack(spacing: 12.0) {
                checkState == true ? Image(systemName: "checkmark.circle.fill") : Image(systemName: "circle")
                SmallProfilePhotoView()
                Text(self.name)
                Spacer()
            }
        }
        .foregroundColor(Color.black)
    }
}
