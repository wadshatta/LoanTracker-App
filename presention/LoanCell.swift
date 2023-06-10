//
//  LoanCell.swift
//  LoanTracker
//
//  Created by MacBook Pro on 10/06/2023.
//

import SwiftUI

struct LoanCell: View {
    let name : String
    let amount : Double
    let date : Date
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 5){
                Text(name)
                    .font(.headline)
                    .fontWeight(.semibold)
                Text(amount,format: .currency(code: "EUR"))
                    .font(.subheadline)
                    .fontWeight(.light)
            }
            Spacer()
            Text(date.formatted(date: .abbreviated, time: .omitted))
                .font(.subheadline)
                .fontWeight(.light)
            
        }
       
    }
}

struct LoanCell_Previews: PreviewProvider {
    static var previews: some View {
        LoanCell(name: "Test Loan", amount: 100, date: Date())
    }
}
