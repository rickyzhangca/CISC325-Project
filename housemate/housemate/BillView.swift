//
//  HomeView.swift
//  housemate
//
//  Created by Ricky Zhang on 2020-03-02.
//  Copyright © 2020 CISC325 Group 10. All rights reserved.
//

import SwiftUI

struct BillView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("123 Paris Hill St")
                        .font(.largeTitle)
                        .padding(.top, -32.0)
                    HStack (spacing: 24) {
                        ProfileButtonView()
                        ProfileButtonView()
                        ProfileButtonView()
                    }
                }
                .padding(.bottom, 32.0)
                
                NavigationLink(destination: NewSplitBillView()) {
                    ButtonView(text: "Post a Split Bill", textColor: Color.blue)
                }.foregroundColor(Color.black)

                SectionHeaderView(text: "Upcoming Payments")
                VStack{
                    BillCardView(title: "June Rent", amount: "$700", recurring: true, text1: "Monthly", text2: "1/4 Paid")
                    BillCardView(title: "Kitchen Paper", amount: "$6 -> $3", recurring: false, text1: "Split Bill", text2: "1/2 Paid")
                }
                .padding(.bottom, 12.0)
                        
                NavigationLink(destination: BillView()) {
                    ButtonView(text: "Add a Payment", textColor: Color.blue)
                }.foregroundColor(Color.black)
                
                NavigationLink(destination: AllPaymentView()) {
                    ButtonView(text: "All Payments", textColor: Color.blue)
                }.foregroundColor(Color.black)
            }
            .padding(.leading, 16.0)
            .padding(.trailing, 16.0)
        }
    }
}

struct BillView_Previews: PreviewProvider {
    static var previews: some View {
        BillView()
    }
}

struct ButtonView: View {
    @State var text:String = "button";
    @State var textColor:Color = Color.black;
    @State var borderColor:Color = Color.blue;
    var body: some View {
        HStack {
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text(self.text)
            }
            Spacer()
        }
        .foregroundColor(self.textColor)
        .padding(.vertical, 16.0)
        .background(Color.white)
        .border(self.borderColor, width: 2)
        .cornerRadius(12.0, antialiased: true)
        .padding(.bottom, 12.0)
    }
}

struct BillCardView : View {
    @State var title:String = "text";
    @State var amount:String = "text";
    @State var recurring:Bool = false;
    @State var text1:String = "text";
    @State var text2:String = "text";
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
        }
        .border(Color.gray, width: 2)
        .padding(.top, 12.0)
    }
}
