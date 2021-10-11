//
//  Task.swift
//  App06
//
//  Created by Alumno on 07/10/21.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct Task: Identifiable, Codable {
    
    @DocumentID var id: String?
    var task: String
    var category_id: String
    var priority_id: String
    var is_completed: Bool
    var date_created: Date
    var due_date: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case task
        case category_id
        case priority_id
        case is_completed
        case date_created
        case due_date
    }
    
}

extension Task {
    
    static let dummy = Task(task: "", category_id: "03", priority_id: "03", is_completed: false, date_created: Date(), due_date: Date())
    
}


