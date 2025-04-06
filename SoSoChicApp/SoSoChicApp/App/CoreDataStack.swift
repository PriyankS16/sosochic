//
//  CoreDataStack.swift
//  SoSoChicApp
//
//  Created by Priyank Saxena on 05/04/25.
//


import CoreData

class CoreDataStack {
    static let shared = CoreDataStack()

    lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "SoSoChicModel")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Core Data failed: \(error)")
            }
        }
        return container
    }()

    var context: NSManagedObjectContext {
        container.viewContext
    }

    func saveContext() {
        guard context.hasChanges else { return }
        try? context.save()
    }
}
