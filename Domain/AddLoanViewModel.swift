//
//  AddLoanViewModel.swift
//  LoanTracker
//
//  Created by MacBook Pro on 10/06/2023.
//

import Foundation

final class AddLoanViewModel: ObservableObject{
    @Published var name = ""
    @Published var amount = ""
    @Published var stratDate = Date()
    @Published var dueDate = Date()
    
    func saveLoan(){
        let loan = Loan(context: PersistenceController.shared.viewContext)
        loan.id = UUID().uuidString
        loan.name = name
        loan.totalAmount = Double(amount) ?? 0.0
        loan.stratDate = stratDate
        loan.dueDate = dueDate
        
        PersistenceController.shared.save()
    }
    
    
    func isInValidForm() -> Bool {
        name.isEmpty || amount.isEmpty
    }
}
