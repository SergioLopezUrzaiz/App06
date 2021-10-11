//
//  CategoryView.swift
//  App06
//
//  Created by Alumno on 11/10/21.
//

import SwiftUI

struct CategoryView: View {
    
    @StateObject var taskModel: TaskModel
    @Binding var task: Task
    
    var body: some View {
        VStack {
            Text(categoryName(task.category_id)).font(.title)
            HStack {
                Spacer()
                ForEach(taskModel.categories) { category in
                    Image(category.image)
                        .resizable()
                        .frame(width: 60, height: 60)
                        .opacity(category.category_id == task.category_id ? 1.0 : 0.2)
                        .onTapGesture {
                            task.category_id = category.category_id
                        }
                }
                Spacer()
            }
        }

    }
    
    func categoryName(_ category_id: String) -> String {
        if let index = taskModel.categories.firstIndex(where: {
            $0.category_id == category_id
        }) {
            return taskModel.categories[index].category
        }
        
        return ""
        
    }
    
}

struct CategoryView_Previews: PreviewProvider {
    
    @State static var task = Task(task: "Tarea 3", category_id: "03", priority_id: "03", is_completed: false, date_created: Date(), due_date: Date())
    
    static var previews: some View {
        CategoryView(taskModel: TaskModel(), task: $task)
    }
}
