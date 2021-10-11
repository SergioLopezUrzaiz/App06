//
//  Category.swift
//  App06
//
//  Created by Alumno on 11/10/21.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct Category: Identifiable, Codable {
    
    @DocumentID var id: String?
    var category_id: String
    var category: String
    var image: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case category_id
        case category
        case image
    }
    
}
