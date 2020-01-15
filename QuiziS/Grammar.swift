//
//  Grammar.swift
//  QuiziS
//
//  Created by sourav sachdeva on 14/01/20.
//  Copyright © 2020 sourav sachdeva. All rights reserved.
//

import Foundation
class Grammar{
    static  var questions = [Question]()
    static func getCurrentQuestion(currentQuestion:Int)->Question{
         return questions[currentQuestion]
     }
static func prepositions(){
       questions.removeAll()
       let question0 = Question(questionText: "I'll be at  home ____ Friday morning.", options: ["at","on","in","behind"], correctAns: 1, wrongAns: -1, isAnswered: false)
       let question1 = Question(questionText: "Rohan is looking ____ you.", options: ["at","for","in","behind"], correctAns: 1, wrongAns: -1, isAnswered: false)
       let question2 = Question(questionText: "We arrived at the airport ____ 2 hours before our flight", options: ["about","for","in","behind"], correctAns: 0, wrongAns: -1, isAnswered: false)
       questions.append(question0)
       questions.append(question1)
       questions.append(question2)
   }
  static func irregularVerbs(){
       questions.removeAll()
       let question0 = Question(questionText: "He likes to ____ motorcycles.", options: ["x","x","x","xx"], correctAns: 1, wrongAns: -1, isAnswered: false)
       let question1 = Question(questionText: "Im so sorry, I ____ to bring it.", options: ["at","for","in","behind"], correctAns: 1, wrongAns: -1, isAnswered: false)
       let question2 = Question(questionText: "We arrived at the airport ____ 2 hours before our flight", options: ["x","x","x","xx"], correctAns: 0, wrongAns: -1, isAnswered: false)
       questions.append(question0)
       questions.append(question1)
       questions.append(question2)
   }
 static  func adjectivesAndAdVerbs(){
       questions.removeAll()
       let question0 = Question(questionText: "I like ____ fruit.", options: ["at","on","in","behind"], correctAns: 1, wrongAns: -1, isAnswered: false)
       let question1 = Question(questionText: "We had ____ pancakes for breakfast.", options: ["at","for","in","behind"], correctAns: 1, wrongAns: -1, isAnswered: false)
       let question2 = Question(questionText: "We arrived at the airport ____ 2 hours before our flight", options: ["about","for","in","behind"], correctAns: 0, wrongAns: -1, isAnswered: false)
       questions.append(question0)
       questions.append(question1)
       questions.append(question2)
   }
 static  func countableAndUncountables(){
        questions.removeAll()
       let question0 = Question(questionText: "I'll be at  home ____ Friday morning Friday morning Friday morning Friday morning Friday morning Friday morning Friday morning Friday morning Friday morning.", options: ["at","on","in","behind"], correctAns: 1, wrongAns: -1, isAnswered: false)
       let question1 = Question(questionText: "Rohan is looking ____ you.", options: ["at","for","in","behind"], correctAns: 1, wrongAns: -1, isAnswered: false)
       let question2 = Question(questionText: "We arrived at the airport ____ 2 hours before our flight", options: ["about","for","in","behind"], correctAns: 0, wrongAns: -1, isAnswered: false)
       questions.append(question0)
       questions.append(question1)
       questions.append(question2)
   }
 static  func infinitivesOrGerunds(){
    questions.removeAll()
       let question0 = Question(questionText: "I'll be at  home ____ Friday morning.", options: ["at","on","in","behind"], correctAns: 1, wrongAns: -1, isAnswered: false)
       let question1 = Question(questionText: "Rohan is looking ____ you.", options: ["at","for","in","behind"], correctAns: 1, wrongAns: -1, isAnswered: false)
       let question2 = Question(questionText: "We arrived at the airport ____ 2 hours before our flight", options: ["about","for","in","behind"], correctAns: 0, wrongAns: -1, isAnswered: false)
       questions.append(question0)
       questions.append(question1)
       questions.append(question2)
   }
  static func MoreOrLess(){
    questions.removeAll()
       let question0 = Question(questionText: "I'll be at  home ____ Friday morning.", options: ["at","on","in","behind"], correctAns: 1, wrongAns: -1, isAnswered: false)
       let question1 = Question(questionText: "Rohan is looking ____ you.", options: ["at","for","in","behind"], correctAns: 1, wrongAns: -1, isAnswered: false)
       let question2 = Question(questionText: "We arrived at the airport ____ 2 hours before our flight", options: ["about","for","in","behind"], correctAns: 0, wrongAns: -1, isAnswered: false)
       questions.append(question0)
       questions.append(question1)
       questions.append(question2)
   }
  static func expressionsOfColor(){
    questions.removeAll()
       let question0 = Question(questionText: "I'll be at  home ____ Friday morning.", options: ["at","on","in","behind"], correctAns: 1, wrongAns: -1, isAnswered: false)
       let question1 = Question(questionText: "Rohan is looking ____ you.", options: ["at","for","in","behind"], correctAns: 1, wrongAns: -1, isAnswered: false)
       let question2 = Question(questionText: "We arrived at the airport ____ 2 hours before our flight", options: ["about","for","in","behind"], correctAns: 0, wrongAns: -1, isAnswered: false)
       questions.append(question0)
       questions.append(question1)
       questions.append(question2)
   }
  static func fewAndLittle(){
    questions.removeAll()
       let question0 = Question(questionText: "I'll be at  home ____ Friday morning.", options: ["at","on","in","behind"], correctAns: 1, wrongAns: -1, isAnswered: false)
       let question1 = Question(questionText: "Rohan is looking ____ you.", options: ["at","for","in","behind"], correctAns: 1, wrongAns: -1, isAnswered: false)
       let question2 = Question(questionText: "We arrived at the airport ____ 2 hours before our flight", options: ["about","for","in","behind"], correctAns: 0, wrongAns: -1, isAnswered: false)
       questions.append(question0)
       questions.append(question1)
       questions.append(question2)
   }
  static func AdverbialClauses(){
    questions.removeAll()
       let question0 = Question(questionText: "I'll be at  home ____ Friday morning.", options: ["at","on","in","behind"], correctAns: 1, wrongAns: -1, isAnswered: false)
       let question1 = Question(questionText: "Rohan is looking ____ you.", options: ["at","for","in","behind"], correctAns: 1, wrongAns: -1, isAnswered: false)
       let question2 = Question(questionText: "We arrived at the airport ____ 2 hours before our flight", options: ["about","for","in","behind"], correctAns: 0, wrongAns: -1, isAnswered: false)
       questions.append(question0)
       questions.append(question1)
       questions.append(question2)
   }
 static  func linkers(){
    questions.removeAll()
       let question0 = Question(questionText: "I'll be at  home ____ Friday morning.", options: ["at","on","in","behind"], correctAns: 1, wrongAns: -1, isAnswered: false)
       let question1 = Question(questionText: "Rohan is looking ____ you.", options: ["at","for","in","behind"], correctAns: 1, wrongAns: -1, isAnswered: false)
       let question2 = Question(questionText: "We arrived at the airport ____ 2 hours before our flight", options: ["about","for","in","behind"], correctAns: 0, wrongAns: -1, isAnswered: false)
       questions.append(question0)
       questions.append(question1)
       questions.append(question2)
   }
 static  func Conjuctions(){
    questions.removeAll()
       let question0 = Question(questionText: "I'll be at  home ____ Friday morning.", options: ["at","on","in","behind"], correctAns: 1, wrongAns: -1, isAnswered: false)
       let question1 = Question(questionText: "Rohan is looking ____ you.", options: ["at","for","in","behind"], correctAns: 1, wrongAns: -1, isAnswered: false)
       let question2 = Question(questionText: "We arrived at the airport ____ 2 hours before our flight", options: ["about","for","in","behind"], correctAns: 0, wrongAns: -1, isAnswered: false)
       questions.append(question0)
       questions.append(question1)
       questions.append(question2)
   }
 static  func Modals(){
    questions.removeAll()
       let question0 = Question(questionText: "I'll be at  home ____ Friday morning.", options: ["at","on","in","behind"], correctAns: 1, wrongAns: -1, isAnswered: false)
       let question1 = Question(questionText: "Rohan is looking ____ you.", options: ["at","for","in","behind"], correctAns: 1, wrongAns: -1, isAnswered: false)
       let question2 = Question(questionText: "We arrived at the airport ____ 2 hours before our flight", options: ["about","for","in","behind"], correctAns: 0, wrongAns: -1, isAnswered: false)
       questions.append(question0)
       questions.append(question1)
       questions.append(question2)
   }
}
