//
//  AddPaymentView.swift
//  housemate
//
//  Created by Ricky Zhang on 2020-03-29.
//  Copyright © 2020 CISC325 Group 10. All rights reserved.
//

import SwiftUI

struct AddPaymentView: View {
    
    @EnvironmentObject var truth: SourceOfTruth
    
    @State var topay: String = ""
    @State var toAmount: String = ""
    @State var toRecur: String = ""
    
    var body: some View {
        VStack {
                ScrollView {
                    HStack {
                        Text("Add a New Payment")
                            .font(.largeTitle)
                            .padding(.bottom, 24.0)
                        Spacer()
                    }

                    VStack {
                        VStack {
                            HStack {
                                Text("What are people paying?")
                                Spacer()
                            }
                            TextField("Rent?", text: $topay)
                                .padding([.top, .leading, .bottom], 12.0)
                                .border(Color.gray, width: 2)
                        }
                        .padding(.bottom)
                        
                        VStack {
                            HStack {
                                Text("How often to recur?")
                                Spacer()
                            }
                            TextField("Monthly", text: $toRecur)
                                .padding([.top, .leading, .bottom], 12.0)
                                .border(Color.gray, width: 2)
                        }
                        
                        HStack {
                            HStack {
                                Text("Amount")
                                Spacer()
                            }
                            TextField("$CAD", text: $toAmount)
                                .padding([.top, .leading, .bottom], 12.0)
                                .border(Color.gray, width: 2)
                            
                        }
                        .padding(.vertical, 16.0)
                        
                        ForEach(truth.Data_Housemates) { h in
                            HousemateSelectorView(checkState: h.checked, name: h.name)
                        }
                    }
                    .padding([.bottom, .trailing], 16.0)
                    .padding(.bottom, 16.0)
                }
                .padding(.leading, 16.0)
                
                Spacer()
                
                HStack {
                    NavigationLink(destination: BillView()
                        .navigationBarHidden(true)
                        .navigationBarTitle(Text(""))) {
                        Button(action:{
                            self.truth.CreateNewPayment(n: self.topay, a: Int(self.toAmount) ?? -1, r: self.toRecur, nutp: self.truth.Selecter_Count, nup: 0)
                        }) {
                            Text("Add")
                                .frame(minWidth: 0, maxWidth: .infinity)
                        }.padding(.horizontal).buttonStyle(MyButtonStyle(color: .blue))
                    }
                }
                .padding(.leading, 16.0)
                .padding(.trailing, 16.0)
            }
        }
    }

struct AddPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        AddPaymentView().environmentObject(SourceOfTruth())
    }
}
