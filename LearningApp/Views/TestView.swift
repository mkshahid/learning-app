//
//  TestView.swift
//  LearningApp
//
//  Created by Michael Shahidi on 6/17/21.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var selectedAnswerIndex:Int?
    @State var numCorrect = 0
    @State var submitted = false
    
    var body: some View {
        
        if model.currentQuestion != nil {
            
            VStack (alignment: .leading) {
                
                // Question number
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                    .padding(.leading, 20)
                
                // Question
                CodeTextView()
                    .padding(.horizontal, 20)
                
                // Answers
                ScrollView {
                    VStack {
                        ForEach (0..<model.currentQuestion!.answers.count, id: \.self) { index in
                            
                            Button(action: {
                                // Track the selected index
                                selectedAnswerIndex = index
                                
                            }, label: {
                                ZStack {
                                    // Answer has not yet been submitted
                                    if !submitted {
                                        RectangleCard(color: index == selectedAnswerIndex ? .gray : .white)
                                            .frame(height: 48)
                                    }
                                    // Answer has been submitted
                                    else {
                                        if (index == selectedAnswerIndex && index == model.currentQuestion!.correctIndex) ||  {
                                            RectangleCard(color: .green)
                                                .frame(height: 48)
                                        }
                                        else if index == selectedAnswerIndex && index != model.currentQuestion!.correctIndex {
                                            RectangleCard(color: .red)
                                                .frame(height: 48)
                                        }
                                        else if index != model.currentQuestion!.correctIndex {
                                            RectangleCard(color: .green)
                                                .frame(height: 48)
                                        }
                                        else {
                                            RectangleCard(color: .white)
                                                .frame(height: 48)
                                        }
                                    }
                                
                                    Text(model.currentQuestion!.answers[index])
                                }
                            })
                            .disabled(submitted)
                        }
                    }
                    .accentColor(.black)
                    .padding()
                }
                
                // Submit Button
                Button(action: {
                    
                    // Change submitted state to true
                    submitted = true
                    
                    // Check the answer and increment the counter if correct
                    if selectedAnswerIndex == model.currentQuestion!.correctIndex {
                        
                    }
                    
                }, label: {
                    ZStack {
                        RectangleCard(color: .green)
                            .frame(height: 48)
                    
                        Text("Submit")
                            .foregroundColor(.white)
                            .bold()
                    }
                    .padding()
                })
                .disabled(selectedAnswerIndex == nil)
                
            }
            .navigationBarTitle("\(model.currentModule?.category ?? "") Test")
            
        }
        
        
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
