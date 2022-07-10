//
//  TaskView.swift
//  MyList
//
//  Created by Abhirath Sujith on 09/07/22.
//

import SwiftUI

struct TaskView: View {
    @EnvironmentObject var realManager: RealmManager
    
    var body: some View {
        VStack{
            Text("My List")
                .font(.title2.bold())
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            List {
                ForEach(realManager.tasks, id: \.id) {
                    task in
                    if !task.isInvalidated {
                        
                        TaskRow(task: task.title, completed: task.completed)
                            .onTapGesture {
                                realManager.updateTask(id: task.id, completed: !task.completed)
                            }
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    realManager.deleteTask(id: task.id)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                    }
                   
                }
                .listRowSeparator(.visible)
            }
            .onAppear {
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableViewCell.appearance()
                    .backgroundColor = UIColor.clear
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.mint)
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
            .environmentObject(RealmManager())
    }
  }
}
