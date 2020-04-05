//
//  CompletedPaymentsView.swift
//  housemate
//
//  Created by Ricky Zhang on 2020-04-05.
//  Copyright © 2020 CISC325 Group 10. All rights reserved.
//

import SwiftUI

struct CompletedPaymentsView: View {
    
    @EnvironmentObject var truth: SourceOfTruth
    
    var body: some View {
        VStack {
        ScrollView {
            HStack {
                    Text("Completed Payments")
                    .font(.largeTitle)
                    .padding(.bottom, 24.0)
                    Spacer()
                }
            VStack{
                ForEach(0..<truth.Data_Payments.count) { i in
                    if self.truth.Data_Payments[i].amount == 0 {
                        CompletedBillCardView(name: self.truth.Data_Payments[i].name,
                                     amount_s: self.truth.Convert(d: self.truth.Data_Payments[i].amount),
                                     recurring: self.truth.Data_Payments[i].recurring,
                                     index:i)
                    }
                }
            }
            .padding(.bottom, 12.0)
            }
        }
        .padding(.horizontal)
    }
}

struct CompletedPaymentsView_Previews: PreviewProvider {
    static var previews: some View {
        CompletedPaymentsView().environmentObject(SourceOfTruth())
    }
}

struct CompletedBillCardView : View {
    
    @State var name: String
    @State var amount_s: String = "-1"
    @State var recurring: String = ""
    
    @State var index: Int = 0
    
    var body: some View {
        NavigationLink(destination: MakePaymentView(index: self.index)) {
            VStack {
                HStack{
                    Text(self.name)
                        .fontWeight(.medium)
                        .foregroundColor(Color.black)
                    Spacer()
                    Text("$\(self.amount_s)")
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                }
                .padding()
                Divider().frame(height: -20.0)
                HStack{
                    Text(self.recurring)
                        .font(.callout)
                        .foregroundColor(Color(UIColor(rgb:0x523DCE)))
                    Spacer()
                }
                .padding()
            }
            .border(Color.gray, width: 2)
            .cornerRadius(8.0)
            .padding(.top, 12.0)
        }.foregroundColor(Color.black)
    }
}
