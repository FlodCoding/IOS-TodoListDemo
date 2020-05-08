//
//  TodoDetails.swift
//  TodoList
//
//  Created by Flood on 2020/5/7.
//  Copyright © 2020 Flood. All rights reserved.
//

import SwiftUI

struct TodoDetails: View {
    @ObservedObject var main:Main
    var body: some View {
        VStack{
            Spacer().frame(height:20)
            HStack{
                Button(action:{
                    UIApplication.shared.keyWindow?.endEditing(true)
                    self.main.detailsShowing = false
                }){
                    Text("取消").padding()
                }
                
                Spacer()
                Button(action:{
                    UIApplication.shared.keyWindow?.endEditing(true)
                    if editingMode{
                        self.main.todos[editingIndex].title =
                            self.main.detailsTitle
                        self.main.todos[editingIndex].dueDate =
                            self.main.detailsDueDate
                        
                    }else{
                        let  newTodo =  Todo(title: self.main.detailsTitle, dueDate: self.main.detailsDueDate)
                        
                        self.main.todos.append(newTodo)
                    }
                    
                    self.main.sort()
                    
                    do{
                        let archiveData = try NSKeyedArchiver.archivedData(withRootObject: self.main.todos, requiringSecureCoding: false)
                        UserDefaults.standard.set(archiveData, forKey: "todos")
                    }catch{
                        print("error")
                    }
                    
                    self.main.detailsShowing = false
                }){
                    
                    Text(editingMode ? "完成":"添加").padding()
                }.disabled(main.detailsTitle == "")
            }
            
            SATextField(tag: 0, text: editingTodo.title, placeholder: "我要..", changeHandler: {(newString) in self.main.detailsTitle = newString}, onCommitHandler: {
                
                
            }).padding(8).foregroundColor(.white)
            
            DatePicker(selection:$main.detailsDueDate,displayedComponents: .date, label: {() -> EmptyView in}).padding()
            
            Spacer()
        }.padding()
            .background(Color("todoDetails-bg"))
            .edgesIgnoringSafeArea(.all)
    }
}

struct TodoDetails_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetails(main: Main())
    }
}
