//
//  TaskDetailView.swift
//  App06
//
//  Created by Alumno on 07/10/21.
//

import SwiftUI

struct TaskDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var taskModel: TaskModel
    @State var task: Task
    var mode: Mode
//    @Binding var ready: Bool
    
    var dateFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MMM/dd"
        return formatter
    }
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Datos Generales")) {
                    TextField("Tarea", text: $task.task)
                        .font(.title)
                    Toggle("Tarea Completada", isOn: $task.is_completed).font(.title)
                }
                Section(header: Text("Categoria")) {
                    CategoryView(taskModel: taskModel, task: $task)
                }
                if(!task.is_completed) {
                    Section(header: Text("Prioridad")) {
                        PriorityView(taskModel: taskModel, task: $task)
                    }
                    Section(header: Text("Fecha de entrega")) {
                        DatePicker(selection: $task.due_date, in: ...Date(),
                                   displayedComponents: .date) {
                            Text("\(dateFormat.string(from: task.due_date))")
                                .font(.title)
                        }
                        Text("Falta(n) \(Int((task.due_date - Date())/86400)) dia(s)")
                    }
                }
            }
            Spacer()
            Button {
                if task.task != "" {
//                    ready = true
                    if mode == .add {
                        addTask()
                        
                    } else {
                        editTask()
                    }
                    presentationMode.wrappedValue.dismiss()
                }
                else {
//                    ready = false
                }
            } label: {
                HStack {
                    Image(systemName: mode == .add ? "square.and.arrow.down" : "pencil.circle")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    Text(mode == .add ? "Agregar" : "Editar")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
            }
            .padding()
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .background(Color.green)
//            .alert(isPresented: $ready) {
//                Alert(title: Text("Error en la tarea"), message: Text("Falta el nombre de la tarea"), dismissButton: .default(Text("Va!")))
//            }
        }
    }
    
    func addTask() {
        
        taskModel.addData(task: task)
        
    }
    
    func editTask() {
        
        taskModel.updateData(task: task)
        
    }
    
}

struct TaskDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        TaskDetailView(taskModel: TaskModel(), task: Task(task: "Tarea 3", category_id: "03", priority_id: "03", is_completed: false, date_created: Date(), due_date: Date()), mode: .add)
    }
}
