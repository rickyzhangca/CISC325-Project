//
//  HomeView.swift
//  housemate
//
//  Created by Ricky Zhang on 2020-03-02.
//  Copyright © 2020 CISC325 Group 10. All rights reserved.
//

import SwiftUI

struct BillView: View {
    
    @EnvironmentObject var truth: SourceOfTruth
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text(self.truth.Data_House.address)
                        .font(.largeTitle)
                    HStack (spacing: 24.0) {
                        ForEach(self.truth.Data_Housemates) { h in
                            ProfileButtonView(name:h.name, icon:h.icon)
                        }
                    }
                }
                .padding(.bottom, 32.0)
                
                NavigationLink(destination: NewSplitBillView()) {
                    ButtonView(text: "Post a Split Bill", textColor: Color.white)
                }.foregroundColor(Color.black)

                SectionHeaderView(text: "Upcoming Payments")
                VStack{
                    ForEach(0..<truth.Data_Payments.count) { i in
                        if self.truth.Data_Payments[i].amount != 0 {
                            BillCardView(name: self.truth.Data_Payments[i].name, amount: self.truth.Data_Payments[i].amount, recurring: self.truth.Data_Payments[i].recurring, num_users_to_pay: self.truth.Data_Payments[i].num_users_to_pay, num_users_paid: self.truth.Data_Payments[i].num_users_paid, index: i)
                        }
                    }
                }
                .padding(.bottom, 12.0)
                        
                NavigationLink(destination: AddPaymentView()) {
                    SecondaryButtonView(text: "Add a Payment", textColor: Color(UIColor(rgb:0x523DCE)))
                }.foregroundColor(Color.black)
                
                NavigationLink(destination: AllPaymentView()) {
                    SecondaryButtonView(text: "All Payments", textColor: Color(UIColor(rgb:0x523DCE)))
                }.foregroundColor(Color.black)
            }
            .padding(.leading, 16.0)
            .padding(.trailing, 16.0)
        }
    }
}

struct BillView_Previews: PreviewProvider {
    static var previews: some View {
        BillView().environmentObject(SourceOfTruth())
    }
}

struct BillCardView : View {
    @State var name: String
    @State var amount: Int = 1
    @State var recurring: String = ""
    @State var num_users_to_pay: Int = 4
    @State var num_users_paid: Int = 1
    @State var index: Int = 0
    
    var body: some View {
        NavigationLink(destination: MakePaymentView(index: self.index)) {
            VStack {
                HStack{
                    Text(self.name)
                        .fontWeight(.medium)
                        .foregroundColor(Color.black)
                    Spacer()
                    Text("$\(self.amount)")
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
                    Text("\(self.num_users_paid)/\(self.num_users_to_pay) Paid")
                        .font(.callout)
                        .foregroundColor(Color(UIColor(rgb:0x523DCE)))
                }
                .padding()
            }
            .border(Color.gray, width: 2)
            .cornerRadius(8.0)
            .padding(.top, 12.0)
        }.foregroundColor(Color.black)
    }
}
