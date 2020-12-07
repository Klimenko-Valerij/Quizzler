//
//  Question.swift
//  Quizzler
//
//  Created by Валерий Клименко on 07.12.2020.
//

import Foundation

struct Question {
  let text: String
  let answers: [String]
  let correctAnswer: String
  
  init(q: String, a: [String], correctAnswer: String) {
    text = q
    answers = a
    self.correctAnswer = correctAnswer
  }
}
