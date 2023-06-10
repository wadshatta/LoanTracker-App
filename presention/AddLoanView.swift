//
//  AddLoanView.swift
//  LoanTracker
//
//  Created by MacBook Pro on 10/06/2023.
//

import SwiftUI

struct AddLoanView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = AddLoanViewModel()
    
    @ViewBuilder
    private func cancelButton() -> some View{
        Button{
            dismiss()
        }label: {
            Text("Cancel")
                .font(.subheadline)
                .fontWeight(.semibold)
        }
        
    }
    @ViewBuilder
    private func SaveButton() -> some View{
        Button{
            viewModel.saveLoan()
                dismiss()
        }label: {
            Text("Done")
                .font(.subheadline)
                .fontWeight(.semibold)
        }
        .disabled(viewModel.isInValidForm())

    }
    
    var body: some View {

        NavigationStack{
            VStack{
                Form {
                    TextField("Name",text:$viewModel.name)
                        .autocapitalization(.sentences)
                    
                    TextField("Amount", text: $viewModel.amount)
                        .keyboardType(.numberPad)
                    DatePicker("Start Date", selection: $viewModel.stratDate,in:...Date(),displayedComponents: .date)
                    DatePicker("Due Date", selection: $viewModel.dueDate, in: viewModel.stratDate... , displayedComponents: .date)
                }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction){
                    cancelButton()
                }
                ToolbarItem(placement: .confirmationAction){
                    SaveButton()
                }

            }
        }
    }
}

struct AddLoanView_Previews: PreviewProvider {
    static var previews: some View {
        AddLoanView()
    }
}
