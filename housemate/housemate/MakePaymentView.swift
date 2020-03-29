//
//  MakePaymentView.swift
//  housemate
//
//  Created by Ricky Zhang on 2020-03-06.
//  Copyright © 2020 CISC325 Group 10. All rights reserved.
//

import SwiftUI

struct MakePaymentView: View {
    
    @EnvironmentObject var truth: SourceOfTruth
    
    @State var topay: String = ""
    @State var index: Int = 0
    
    var body: some View {
        ScrollView {
            HStack {
                Text("Make Payment")
                    .font(.largeTitle)
                    .padding(.bottom, 24.0)
                Spacer()
            }

            VStack{
                FullBillCardView(name: self.truth.Data_Payments[self.index].name, amount: self.truth.Data_Payments[self.index].amount, recurring: self.truth.Data_Payments[self.index].recurring, num_users_to_pay: self.truth.Data_Payments[self.index].num_users_to_pay, num_users_paid: self.truth.Data_Payments[self.index].num_users_paid, dueDate:self.truth.Data_Payments[self.index].due_date, showPayButton: false, index: self.index)
                
                SectionHeaderView(text: "Payment Method")
                
                HStack {
                    HStack {
                        Text("Amount")
                        Spacer()
                    }
                    TextField("$CAD", text: $topay)
                        .padding([.top, .leading, .bottom], 12.0)
                        .border(Color.gray, width: 2)
                    
                }
                .padding(.bottom, 24.0)
            }
            .padding(.bottom, 12.0)
                        
            NavigationLink(destination: BillView()) {
                Button(action:{
                    let temp = Int(self.topay)
                    print(self.topay)
                    if temp == self.truth.Data_Payments[self.index].amount {
                        self.truth.Data_Payments[self.index].amount = 0
                    }
                    else {
                        self.truth.Data_Payments[self.index].amount -= temp ?? 99999
                    }
                }) {
                    Text("Pay")
                        .frame(minWidth: 0, maxWidth: .infinity)
                }.buttonStyle(MyButtonStyle(color: .blue))
            }
            
        }
        .padding(.leading, 16.0)
        .padding(.trailing, 16.0)
    }
}

struct MakePaymentView_Previews: PreviewProvider {
    static var previews: some View {
        MakePaymentView().environmentObject(SourceOfTruth())
    }
}
