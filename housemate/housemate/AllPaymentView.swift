//
//  AllPaymentView.swift
//  housemate
//
//  Created by Ricky Zhang on 2020-03-06.
//  Copyright © 2020 CISC325 Group 10. All rights reserved.
//

import SwiftUI

struct AllPaymentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                        Text("All Payments")
                            .font(.largeTitle)
                            .padding(.bottom, 24.0)
                        Spacer()
                    }

                    VStack{
                        FullBillCardView(title: "June Rent", amount: "$700", recurring: true, text1: "Monthly", text2: "1/4 Paid", dueDate: "Jun 1, 2020")
                        FullBillCardView(title: "Kitchen Paper", amount: "$6 -> $2", recurring: true, text1: "Split Bill", text2: "1/2 Paid", dueDate: "Jun 1, 2020")
                        FullBillCardView(title: "July Rent", amount: "$700", recurring: true, text1: "Monthly", text2: "0/4 Paid", dueDate: "Jul 1, 2020")
                    }
                    .padding(.bottom, 12.0)
                }
                .padding(.leading, 16.0)
                .padding(.trailing, 16.0)
        }
    }
}

struct AllPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        AllPaymentView()
    }
}

struct FullBillCardView : View {
    @State var title:String = "text";
    @State var amount:String = "text";
    @State var recurring:Bool = false;
    @State var text1:String = "text";
    @State var text2:String = "text";
    @State var dueDate:String = "text";
    @State var showPayButton:Bool = true;
    var body: some View {
        VStack {
            HStack{
                Text(self.title)
                    .fontWeight(.medium)
                Spacer()
                Text(self.amount)
                    .fontWeight(.semibold)
            }
            .padding()
            Divider().frame(height: -20.0)
            HStack{
                Text(self.text1)
                    .font(.callout)
                    .foregroundColor(Color.blue)
                Spacer()
                Text(self.text2)
                    .font(.callout)
                    .foregroundColor(Color.blue)
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
                NavigationLink(destination: MakePaymentView()) {
                    ButtonView(text: "Pay Now", textColor: Color.blue)
                }.foregroundColor(Color.black)
            }
        }
        .border(Color.gray, width: 2)
        .padding(.top, 12.0)
    }
}
