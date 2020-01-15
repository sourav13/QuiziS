//
//  Grammar.swift
//  QuiziS
//
//  Created by sourav sachdeva on 14/01/20.
//  Copyright © 2020 sourav sachdeva. All rights reserved.
//

import Foundation
class Grammar{
    func getPlist(withName name: String) -> AnyObject?
    {
        if  let path = Bundle.main.path(forResource: name, ofType: "plist"),
            let xml = FileManager.default.contents(atPath: path)
        {
            return (try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil) as AnyObject?) 
        }
        return nil
    }
    
    func grammar(grammarType:String)->[Question]{
        guard let array =  getPlist(withName: grammarType) as? [AnyObject] else {return []}
        var questions = [Question]()
        for x in array{
            let element = x as? [String:AnyObject]
            guard let questionText = element?["QuestionText"] as? String else {return []}
            guard let options = x["options"] as? [String] else {return []}
            let question = Question(questionText: questionText, options: options , correctAns: element?["correctAns"] as! Int, wrongAns: -1, isAnswered: false)
            questions.append(question)
        }
        return questions
    }
}
enum GrammarType:String{
    case prepositions
    case irregularverbs
    case adjectivesandadverbs
    case modals
    case linkers
    case fewandlittle
    case adverbialclauses
    case moreorless
    case countableanduncountables
    case infinitivesorgerunds
    case conjunctions
    case expressionsofcolor
}
