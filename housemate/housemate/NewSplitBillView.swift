//
//  NewSplitBillView.swift
//  housemate
//
//  Created by Ricky Zhang on 2020-03-06.
//  Copyright © 2020 CISC325 Group 10. All rights reserved.
//

import SwiftUI

struct NewSplitBillView: View {
    
    @EnvironmentObject var truth: SourceOfTruth
    
    @State var toSplit: String = ""
    @State var count: Int = 1
    @State var toAmount: String = ""
    
    var body: some View {
        VStack {
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
                            Text("Total Amount")
                            Spacer()
                        }
                        TextField("$CAD", text: $toAmount)
                            .padding([.top, .leading, .bottom], 12.0)
                            .border(Color.gray, width: 2)
                        
                    }
                    .padding(.bottom, 24.0)
                    
                    ForEach(truth.Data_Housemates) { h in
                        HousemateSelectorView(checkState: h.checked, name: h.name)
                    }
                }
                .padding(.trailing, 16.0)
                .padding(.bottom, 16.0)
            }
            .padding(.leading, 16.0)
            
            Spacer()
            
            HStack {
                NavigationLink(destination: BillView()) {
                    Button(
                        action:{
                            let temp = (Int(self.toAmount) ?? -2)/2
                            self.truth.CreateNewPayment(n: self.toSplit, a: temp, r: "Split Bill $\(self.toAmount) -> $\(temp)", nutp: self.truth.Selecter_Count, nup: 0)
                            self.truth.Selecter_Count = 0
                    }) {
                        Text("Post")
                            .frame(minWidth: 0, maxWidth: .infinity)
                    }.padding(.horizontal).buttonStyle(MyButtonStyle(color: .blue))
                }
            }
            .padding(.leading, 16.0)
            .padding(.trailing, 16.0)
        }
    }
}

struct NewSplitBillView_Previews: PreviewProvider {
    static var previews: some View {
        NewSplitBillView().environmentObject(SourceOfTruth())
    }
}

struct HousemateSelectorView: View {
    
    @EnvironmentObject var truth: SourceOfTruth
    
    @State var checkState:Bool;
    @State var name:String = "Alice Bob";
    var body: some View {
        Button(action:
            {
                if self.checkState == true {
                    self.truth.Selecter_Count -= 1
                }
                else {
                    self.truth.Selecter_Count += 1
                }
                self.checkState = !self.checkState
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
