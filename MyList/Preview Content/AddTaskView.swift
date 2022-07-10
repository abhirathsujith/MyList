//
//  AddTaskView.swift
//  MyList
//
//  Created by Abhirath Sujith on 09/07/22.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var realManager: RealmManager
    
    @State private var title: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20)
        {
            Text("New Task?")
                .font(.title2).bold()
                .frame(maxHeight: .infinity, alignment: .leading)
            
            TextField("Your Task!", text: $title )
                .textFieldStyle(.roundedBorder)
            
            Button {
                if title != "" {
                    realManager.addTask(taskTitle: title)
                }
                realManager.addTask(taskTitle: title)
                dismiss()
            } label: {
                Text("Add Task")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(.orange)
                    .cornerRadius(40)
            }
            
            Spacer()
        }
        .padding(.top, 40)
        .padding(.horizontal)
        .background(.mint)
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
            .environmentObject(RealmManager())
    }
}
