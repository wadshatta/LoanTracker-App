//
//  Persistence.swift
//  LoanTracker
//
//  Created by MacBook Pro on 10/06/2023.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

  

    let container: NSPersistentContainer
    var viewContext: NSManagedObjectContext{
        container.viewContext
    }

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "LoanTracker")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
              
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    func save(){
        do{
            try viewContext.save()
        }
        catch{
            print("Error in saving CD,\(error.localizedDescription)")
        }
    }
}
