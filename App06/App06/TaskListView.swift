//
//  ContentView.swift
//  App06
//
//  Created by Alumno on 07/10/21.
//

import SwiftUI

struct TaskListView: View {
    
    @StateObject var taskModel = TaskModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    if taskModel.tasks.count > 0 {
                        ForEach(taskModel.tasks) { task in
                            NavigationLink(destination: TaskDetailView(taskModel: taskModel, task: task)) {
                                Text("Nombre: " + task.task)
                            }
                        }
                        .onDelete { indexSet in
                            for index in indexSet {
                                deleteTask(task: taskModel.tasks[index])
                            }
                            
                        }
                    } else {
                        Text("No Tareas")
                    }

                }
                VStack {
                    Spacer()
                    Button {
                        addTask()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.green)
                    }

                }
            }
            .navigationBarTitle("Tareas", displayMode: .inline)
            .listStyle(DefaultListStyle())
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Tareas")
                        .font(.largeTitle)
                        .foregroundColor(.orange)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }
    }
    
    func deleteTask(task: Task) {
        taskModel.removeData(task: task)
    }
    
    func addTask() {
        
        let task = Task(task: "Tarea 3", category_id: "03", priority_id: "03", is_completed: false, date_created: Date(), due_date: Date())
        
        taskModel.addData(task: task)
        
    }
    
    
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
