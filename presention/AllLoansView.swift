//
//  ContentView.swift
//  LoanTracker
//
//  Created by MacBook Pro on 10/06/2023.
//

import SwiftUI
import CoreData

struct AllLoansView: View {
    @Environment(\.managedObjectContext) var viewContext
    @State private var isAddLoanShowing = false
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Loan.stratDate, ascending: true)],
                  animation: .default)
    private var loans: FetchedResults<Loan>
    
    
@ViewBuilder
    private func addButton() -> some View{
        Button{
           isAddLoanShowing = true
        }label: {
            Image(systemName: "plus.circle")
                .font(.title3)
        }
        .padding([.vertical,.leading],5)
    }

    var body: some View {
        NavigationStack{
            List{
                ForEach(loans){loan in
                    LoanCell(name: loan.wrappedName, amount: loan.totalAmount,
                             date: loan.wrappedDate)
                }
            }
            .navigationTitle("All Loans")
            .toolbar {
                ToolbarItem (placement: .navigationBarTrailing){
                    addButton()
                }
            }
            .sheet(isPresented: $isAddLoanShowing) {
                AddLoanView()
            }
        }
    }




}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AllLoansView()
    }
}
