//
//  ContentView.swift
//  TodoList
//
//  Created by Flood on 2020/5/7.
//  Copyright © 2020 Flood. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack{
            Text("Hello, World!")
            Button(action: {
            }) {
                Text("sssss")
                    .padding()
                    .background(Color.red)
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
