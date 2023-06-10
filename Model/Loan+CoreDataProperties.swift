//
//  Loan+CoreDataProperties.swift
//  LoanTracker
//
//  Created by MacBook Pro on 10/06/2023.
//
//

import Foundation
import CoreData


extension Loan {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Loan> {
        return NSFetchRequest<Loan>(entityName: "Loan")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var dueDate: Date?
    @NSManaged public var stratDate: Date?
    @NSManaged public var totalAmount: Double
    @NSManaged public var payments: NSSet?
    
    public var wrappedName: String{
        name ?? "Unknown"
    }
    public var wrappedDate: Date {
        dueDate ?? Date()
    }
    public var paymentArray: [Payment] {
        let set = payments as? Set<Payment> ?? []
        return set.sorted{
            $0.wrappedDate < $1.wrappedDate
        }
    }

}

// MARK: Generated accessors for payments
extension Loan {

    @objc(addPaymentsObject:)
    @NSManaged public func addToPayments(_ value: Payment)

    @objc(removePaymentsObject:)
    @NSManaged public func removeFromPayments(_ value: Payment)

    @objc(addPayments:)
    @NSManaged public func addToPayments(_ values: NSSet)

    @objc(removePayments:)
    @NSManaged public func removeFromPayments(_ values: NSSet)

}

extension Loan : Identifiable {

}
