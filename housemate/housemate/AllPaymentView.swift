//
//  AllPaymentView.swift
//  housemate
//
//  Created by Ricky Zhang on 2020-03-06.
//  Copyright © 2020 CISC325 Group 10. All rights reserved.
//

import SwiftUI

struct AllPaymentView: View {
    
    @EnvironmentObject var truth: SourceOfTruth
    
    var body: some View {
        ScrollView {
        HStack {
                Text("All Payments")
                    .font(.largeTitle)
                    .padding(.bottom, 24.0)
                Spacer()
            }

            VStack{
                ForEach(0..<truth.Data_Payments.count) { i in
                    if self.truth.Data_Payments[i].amount != 0 {
                        FullBillCardView(name: self.truth.Data_Payments[i].name, amount: self.truth.Data_Payments[i].amount, recurring: self.truth.Data_Payments[i].recurring, num_users_to_pay: self.truth.Data_Payments[i].num_users_to_pay, num_users_paid: self.truth.Data_Payments[i].num_users_paid, dueDate:self.truth.Data_Payments[i].due_date, showPayButton: true, index: i)
                    }
                }
            }
            .padding(.bottom, 12.0)
        }
        .padding(.leading, 16.0)
        .padding(.trailing, 16.0)
    }
}

struct AllPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        AllPaymentView().environmentObject(SourceOfTruth())
    }
}

struct FullBillCardView : View {
    @State var name: String
    @State var amount: Int = 1
    @State var recurring: String = ""
    @State var num_users_to_pay: Int = 4
    @State var num_users_paid: Int = 1
    @State var dueDate:String = "text";
    @State var showPayButton:Bool = true;
    @State var index: Int = 0
    var body: some View {
        VStack {
            HStack{
                Text(self.name)
                    .fontWeight(.medium)
                Spacer()
                Text("$\(self.amount)")
                    .fontWeight(.semibold)
            }
            .padding()
            Divider().frame(height: -20.0)
            HStack{
                Text(self.recurring)
                    .font(.callout)
                    .foregroundColor(Color(UIColor(rgb:0x523DCE)))
                Spacer()
                Text("\(self.num_users_paid)/\(self.num_users_to_pay) Paid")
                    .font(.callout)
                    .foregroundColor(Color(UIColor(rgb:0x523DCE)))
            }
            .padding()
            HStack{
                Text("Due Date")
                    .font(.callout)
                Spacer()
                Text(self.dueDate)
                    .font(.callout)
            }
            .padding()
            .padding(.top, -12.0)
            
            if showPayButton {
                NavigationLink(destination: MakePaymentView(index: self.index)) {
                    SecondaryButtonView(text: "Pay Now", textColor: Color(UIColor(rgb:0x523DCE)))
                }.padding(.horizontal, 8.0).foregroundColor(Color.black)
            }
        }
        .border(Color.gray, width: 2)
        .padding(.top, 12.0)
    }
}
