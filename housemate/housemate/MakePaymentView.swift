//
//  MakePaymentView.swift
//  housemate
//
//  Created by Ricky Zhang on 2020-03-06.
//  Copyright © 2020 CISC325 Group 10. All rights reserved.
//

import SwiftUI

struct MakePaymentView: View {
    @State var toSplit: String = ""
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
                    FullBillCardView(title: "June Rent", amount: "$700", recurring: true, text1: "Monthly", text2: "1/4 Paid", dueDate: "Jun 1, 2020", showPayButton: false)
                    
                    SectionHeaderView(text: "Payment Method")
                    
                    HStack {
                        HStack {
                            Text("Amount")
                            Spacer()
                        }
                        TextField("$CAD", text: $toSplit)
                            .padding([.top, .leading, .bottom], 12.0)
                            .border(Color.gray, width: 2)
                        
                    }
                    .padding(.bottom, 24.0)
                }
                .padding(.bottom, 12.0)
                
                NavigationLink(destination: AllPaymentView()) {
                    ButtonView(text: "Pay", textColor: Color.blue)
                }
                .foregroundColor(Color.black)
            }
            .padding(.leading, 16.0)
            .padding(.trailing, 16.0)
        }
    }
}

struct MakePaymentView_Previews: PreviewProvider {
    static var previews: some View {
        MakePaymentView()
    }
}
