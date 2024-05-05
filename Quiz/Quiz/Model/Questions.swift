//
//  Questions.swift
//  Quiz
//
//  Created by Adithya on 05/05/24.
//

import Foundation


struct Question{
    var text:String
    var answer:[String]
    var correctAnswer:String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.answer = a
        self.correctAnswer = correctAnswer
    }
   
}
