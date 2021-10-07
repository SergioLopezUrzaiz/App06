//
//  taskModel.swift
//  App06
//
//  Created by Alumno on 07/10/21.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

class TaskModel: ObservableObject {
    
    @Published var tasks = [Task]()
    
    private let db = Firestore.firestore()
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        db.collection("Tasks").order(by: "due_date").addSnapshotListener { (querySnapshot, error) in
            
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.tasks = documents.compactMap { queryDocumentSnapshot -> Task? in return try? queryDocumentSnapshot.data(as: Task.self)
            }
            
        }
    }
    
    func addData(task: Task) {
        if let taskID = task.id {
            db.collection("Tasks").document(taskID).delete()
        }
    }
    
    func updateData(task: Task) {
        if let taskID = task.id {
            do {
                try db.collection("Tasks").document(taskID).setData(from: task)
            }
            catch {
                print("There was an error while trying to update a task \(error.localizedDescription).")
            }
        }
    }
    
    func removeData(task: Task) {
        
    }
    
    
}
