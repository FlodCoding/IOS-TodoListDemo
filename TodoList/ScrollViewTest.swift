//
//  ScrollView.swift
//  TodoList
//
//  Created by Flood on 2020/5/8.
//  Copyright © 2020 Flood. All rights reserved.
//

import SwiftUI

var testData:[String] = [
"aaa11",
"aaa22",
"aaa22",
"aaa22",
"aaa22",
"aaa22",
"aaa22",
"aaa22",
"aaa22",
"aaa22",
]
struct ScrollViewTest: View {
    var body: some View {
        ScrollView{
    
            VStack{
                Text("xxxxxx")
                Spacer()
                Text("xxxxxx")
                 Spacer()
                Text("xxxxxx")
                Text("xxxxxx")
                Text("xxxxxx")
                Text("xxxxxx")
                Text("xxxxxx")
                Text("xxxxxx")
                
            }
            
        
         
        }
       
    }
}

struct ScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewTest()
    }
   
}


