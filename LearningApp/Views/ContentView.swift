//
//  ContentView.swift
//  LearningApp
//
//  Created by Michael Shahidi on 6/15/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        ScrollView {
            
            LazyVStack {
                
                // Confirm that current module is set
                if model.currentModule != nil {
                    
                    ForEach (0..<model.currentModule!.content.lessons.count) { index in
                        
                        ContentViewRow(index: index)
                    }
                }
                
                
            }
            .padding()
            .navigationTitle("Learn \(model.currentModule?.category ?? "")")
            
        }
        
        
    }
}
