//
//  Question.swift
//  QuiziS
//
//  Created by sourav sachdeva on 14/01/20.
//  Copyright © 2020 sourav sachdeva. All rights reserved.
//

import Foundation
struct Question{
    let questionText:String
    let options:[String]
    let correctAns:Int
    var wrongAns:Int
    var isAnswered:Bool
}
