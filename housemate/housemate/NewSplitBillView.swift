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
                        HousemateSelectorView(checkState: h.checked, name: h.name, icon: h.icon)
                    }
                }
                .padding(.trailing, 16.0)
                .padding(.bottom, 16.0)
            }
            .padding(.leading, 16.0)
            
            Spacer()
            
            HStack {
                NavigationLink(destination: BillView()
                    .navigationBarHidden(true)
                    .navigationBarTitle(Text(""))) {
                    Button(
                        action:{
                            let temp = Double((Double(self.toAmount) ?? 0)/Double(self.truth.Selecter_Count.count))
                            self.truth.CreateNewPayment(n: self.toSplit, a: temp, r: "Split Bill $\(self.toAmount) -> $\(self.truth.Convert(d: temp))", nutp: self.truth.Selecter_Count.count, nup: 0, untp: self.truth.Selecter_Count_Names, unp: [], uitp:self.truth.Selecter_Count, uip: [])
                            self.truth.Selecter_Count = []
                    }) {
                        Text("Post")
                            .frame(minWidth: 0, maxWidth: .infinity)
                    }
                    .buttonStyle(MyButtonStyle(color: Color(UIColor(rgb:0x523DCE))))
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

