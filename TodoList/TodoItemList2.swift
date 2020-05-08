//
//  TodoList.swift
//  TodoList
//
//  Created by Flood on 2020/5/7.
//  Copyright © 2020 Flood. All rights reserved.
//

import SwiftUI
var exampletodos2:[Todo] = [
    Todo(title: "起床", dueDate: Date()),
    Todo(title: "刷牙", dueDate: Date()),
    Todo(title: "吃饭", dueDate: Date()),
    Todo(title: "睡觉", dueDate: Date())
]
struct TodoItemList2: View {
    @ObservedObject var main: Main
    init(main: Main) {
    if let data = UserDefaults.standard.object(forKey: "todos") as? Data {
                       let list = NSKeyedUnarchiver.unarchiveObject(with: data) as? [Todo] ?? []
                       for todo in list {
                           if !todo.checked {
                               main.todos.append(todo)
                           }
                       }
                       
                   } else {
                       main.todos = exampletodos
                       
                   }
                   
                   main.sort()
        self.main = main
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(main.todos) { todo in
                    VStack {
                        if todo.i == 0 || formatter.string(from: self.main.todos[todo.i].dueDate) != formatter.string(from: self.main.todos[todo.i - 1].dueDate) {
                            HStack {
                                Spacer()
                                    .frame(width: 30)
                                Text(date2Word(date: self.main.todos[todo.i].dueDate))
                                Spacer()
                            }
                        }
                        HStack {
                            Spacer().frame(width: 20)
                            TodoItem(main: self.main, todoIndex: .constant(todo.i))
                                .cornerRadius(10.0)
                                .clipped()
                                .shadow(color: Color("todoItemShadow"), radius: 5)
                            Spacer().frame(width: 25)
                        }
                        Spacer().frame(height: 20)
                    }
                }
                Spacer()
                .frame(height: 150)
                
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarTitle(Text("待办事项")
            .foregroundColor(Color("theme")))
            .onAppear {
//                if let data = UserDefaults.standard.object(forKey: "todos") as? Data {
//                    let list = NSKeyedUnarchiver.unarchiveObject(with: data) as? [Todo] ?? []
//                    for todo in list {
//                        if !todo.checked {
//                            self.main.todos.append(todo)
//                        }
//                    }
//
//                } else {
//                    self.main.todos = exampletodos
//
//                }
//
//                self.main.sort()
                
            }
        }
    }
}

struct TodoItemList_Previews2: PreviewProvider {
    static var previews: some View {
//        let main = Main()
//        main.todos = exampletodos2
//       let view =  TodoItemList2(main: main)
//      return  view
        
        TodoItemList2(main: Main())
    }
}
