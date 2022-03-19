//
//  ManagedObjectContext.swift
//  AppCoreData
//
//  Created by Matheus Lenke on 17/03/22.
//

import Foundation
import UIKit
import CoreData

typealias onCompletionHandler = (String) -> Void

protocol managedProtocol {
   func getPerson() -> [Person]
}

protocol managedSavedProtocol {
    func save(person: Person, onCompletionHandler: onCompletionHandler)
}

protocol managedDeleteProtocol {
    func delete(uuid: String, onCompletionHandler: onCompletionHandler)
}

class ManagedObjectContext: managedProtocol, managedSavedProtocol, managedDeleteProtocol {
    
    private let entity = "Users"
    
    static var shared: ManagedObjectContext = {
        let instance = ManagedObjectContext()
        return instance
    }()
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func getPerson() -> [Person] {
        var listPerson: [Person] = []
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entity)
        
        do {
            guard let persons = try getContext().fetch(fetchRequest) as? [NSManagedObject] else { return listPerson }
            
            for item in persons {
                if let id = item.value(forKey: "id") as? UUID,
                let name = item.value(forKey: "name") as? String,
                let lastName = item.value(forKey: "lastName") as? String,
                   let age = item.value(forKey: "age") as? Int {
                    print("Id é: \(id) \(name) \(lastName) \(age)")
                    
                    let person = Person(id: id, name: name, lastName: lastName, age: age)
                    listPerson.append(person)
                }
            }
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        return listPerson
    }
    
    func save(person: Person, onCompletionHandler: (String) -> Void) {
        let context = getContext()
        
        guard let entity = NSEntityDescription.entity(forEntityName: entity, in: context) else { return }
        
        let transaction = NSManagedObject(entity: entity, insertInto: context)
        
        transaction.setValue(person.id, forKey: "id")
        transaction.setValue(person.name, forKey: "name")
        transaction.setValue(person.lastName, forKey: "lastName")
        transaction.setValue(person.age, forKey: "age")
        
        do {
            try context.save()
            
            onCompletionHandler("Save Success!")
            
        } catch let error as NSError {
            print("Could not save \(error.localizedDescription)")
        }
    }
    
    func delete(uuid: String, onCompletionHandler: (String) -> Void) {
        let context = getContext()
        let predicate = NSPredicate(format: "id == %@", "\(uuid)")
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entity)
        fetchRequest.predicate = predicate
        
        do {
            
            let fetchResults = try context.fetch(fetchRequest) as! [NSManagedObject]
            
            if let entityDelete = fetchResults.first {
                context.delete(entityDelete)
            }
            
            try context.save()
            
            onCompletionHandler("Delete Success!")
            
        } catch let error as NSError {
            print("Fetch failed \(error.localizedDescription)")
        }
    }
    
}
